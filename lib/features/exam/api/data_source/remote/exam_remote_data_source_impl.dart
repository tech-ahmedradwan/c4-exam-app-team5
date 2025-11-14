import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/exam_remote_data_source_contract.dart';
import '../../../data/models/exam_questions_response/exam_questions_response.dart';
import '../../api_client/exam_api_client.dart';

@Injectable(as: ExamRemoteDataSourceContract)
class ExamRemoteDataSourceImpl extends ExamRemoteDataSourceContract {
  ExamRemoteDataSourceImpl(this._examApiClient);

  final ExamApiClient _examApiClient;

  @override
  Future<ExamQuestionsResponse> fetchExamQuestions({required String examId}) async {
    return await _examApiClient.fetchExamQuestions(examId: examId);
  }
}
