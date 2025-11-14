import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entity/answer_entity.dart';
import '../../domain/entity/exam_entity.dart';
import '../../domain/entity/question_entity.dart';
import '../../domain/repo/exam_repo_contract.dart';
import '../data_sources/remote/exam_remote_data_source_contract.dart';
import '../models/exam_questions_response/exam_questions_response.dart';

@Injectable(as: ExamRepoContract)
class ExamRepoImpl extends ExamRepoContract {
  ExamRepoImpl(this._examRemoteDataSource);

  final ExamRemoteDataSourceContract _examRemoteDataSource;

  Future<BaseResponse<T>> _executeExamRequest<T>(
    String examId,
    T Function(ExamQuestionsResponse response) transform,
  ) async {
    try {
      final response = await _examRemoteDataSource.fetchExamQuestions(
        examId: examId,
      );
      final result = transform(response);
      return SuccessResponse(result);
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse(ServerFailure(appError.message));
      }
      return const ErrorResponse(ServerFailure('Server error occurred.'));
    } catch (e) {
      return const ErrorResponse(
        ServerFailure('An unexpected error occurred.'),
      );
    }
  }

  @override
  Future<BaseResponse<List<AnswerEntity>>> fetchExamAnswers(
    String examId,
  ) async {
    return _executeExamRequest(examId, (response) {
      final answerEntity =
          response.questions
              ?.expand((e) => e.answers ?? [])
              .whereType<AnswerEntity>()
              .toList() ??
          <AnswerEntity>[];
      return answerEntity;
    });
    // try {
    //   final response = await _examRemoteDataSource.fetchExamQuestions(examId);
    //   final answerEntity =
    //       response.questions
    //           ?.expand((question) => question.answers ?? [])
    //           .cast<AnswerEntity>()
    //           .toList() ??
    //           <AnswerEntity>[];
    //   return SuccessResponse(answerEntity);
    // } on DioException catch (e) {
    //   if (e.error is AppException) {
    //     final appError = e.error as AppException;
    //     return ErrorResponse(ServerFailure(appError.message));
    //   }
    //   return const ErrorResponse(ServerFailure('Server error occurred.'));
    // } catch (e) {
    //   return const ErrorResponse(
    //     ServerFailure('An unexpected error occurred.'),
    //   );
    // }
  }

  @override
  Future<BaseResponse<ExamEntity>> fetchExamDetails(String examId) async {
    return _executeExamRequest(examId, (response) {
      final examEntity =
          response.questions?.firstOrNull?.exam?.toExamEntity() ?? ExamEntity();
      return examEntity;
    });
    // try {
    //   final response = await _examRemoteDataSource.fetchExamQuestions(examId);
    //   final examEntity = response.questions?.isNotEmpty == true
    //       ? response.questions!.first.exam?.toExamEntity() ?? ExamEntity()
    //       : ExamEntity();
    //   return SuccessResponse(examEntity);
    // } on DioException catch (e) {
    //   if (e.error is AppException) {
    //     final appError = e.error as AppException;
    //     return ErrorResponse(ServerFailure(appError.message));
    //   }
    //   return const ErrorResponse(ServerFailure('Server error occurred.'));
    // } catch (e) {
    //   return const ErrorResponse(
    //     ServerFailure('An unexpected error occurred.'),
    //   );
    // }
  }

  @override
  Future<BaseResponse<List<QuestionEntity>>> fetchExamQuestions(
    String examId,
  ) async {
    return _executeExamRequest(examId, (response) {
      final questionEntity =
          response.questions?.map((e) => e.toEntity()).toList() ?? [];
      return questionEntity;
    });
    // try {
    //   final response = await _examRemoteDataSource.fetchExamQuestions(examId);
    //   final questionEntity =
    //       response.questions?.map((e) => e.toEntity()).toList() ?? [];
    //   return SuccessResponse(questionEntity);
    // } on DioException catch (e) {
    //   if (e.error is AppException) {
    //     final appError = e.error as AppException;
    //     return ErrorResponse(ServerFailure(appError.message));
    //   }
    //   return const ErrorResponse(ServerFailure('Server error occurred.'));
    // } catch (e) {
    //   return const ErrorResponse(
    //     ServerFailure('An unexpected error occurred.'),
    //   );
    // }
  }
}
