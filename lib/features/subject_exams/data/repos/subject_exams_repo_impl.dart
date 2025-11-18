import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entity/subject_exam_entity.dart';
import '../../domain/repos/subject_exam_repo_contract.dart';
import '../datasources/remote/get_subject_exams_remote_datasource_contract.dart';

@Injectable(as: SubjectExamRepoContract)
class SubjectExamsRepoImpl implements SubjectExamRepoContract {
  const SubjectExamsRepoImpl(this._remoteDatasourceContract);

  final SubjectExamsRemoteDatasourceContract _remoteDatasourceContract;
  @override
  Future<BaseResponse<List<SubjectExamEntity>>> getSubjectExams(
    String subjectId,
  ) async {
    try {
      final response = await _remoteDatasourceContract.getSubjectExams(
        subjectId,
      );
      final exams = response.exams!.map((dto) => dto.toEntity()).toList();
      return SuccessResponse<List<SubjectExamEntity>>(exams);
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse<List<SubjectExamEntity>>(
          ServerFailure(appError.message),
        );
      }
      return const ErrorResponse(ServerFailure('Server error occurred.'));
    } catch (e) {
      return const ErrorResponse<List<SubjectExamEntity>>(
        ServerFailure('An unexpected error occurred.'),
      );
    }
  }
}
