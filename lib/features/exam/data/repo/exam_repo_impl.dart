import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/services/remote/safe_api_call/safe_api_call.dart';
import '../../domain/entity/question_entity.dart';
import '../../domain/repo/exam_repo_contract.dart';
import '../data_sources/remote/exam_remote_data_source_contract.dart';


@Injectable(as: ExamRepoContract)
class ExamRepoImpl implements ExamRepoContract {
  ExamRepoImpl(this._examRemoteDataSource);

  final ExamRemoteDataSourceContract _examRemoteDataSource;

  @override
  Future<BaseResponse<List<QuestionEntity>>> fetchExamQuestions(
    String examId,
  ) async => safeApiCall<List<QuestionEntity>>(() async {
    final response = await _examRemoteDataSource.fetchExamQuestions(
      examId: examId,
    );
    return response.questions?.map((e) => e.toEntity()).toList() ??
        <QuestionEntity>[];
  });
}
