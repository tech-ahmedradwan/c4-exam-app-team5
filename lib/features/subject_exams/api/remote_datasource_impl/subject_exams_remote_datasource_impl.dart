import 'package:injectable/injectable.dart';

import '../../data/datasources/remote/get_subject_exams_remote_datasource_contract.dart';
import '../../data/models/subject_exam_response/subject_exam_response.dart';
import '../api_client/subject_exam_api_client.dart';

@Injectable(as: SubjectExamsRemoteDatasourceContract)
class SubjectExamsRemoteDatasourceImpl
    implements SubjectExamsRemoteDatasourceContract {
  SubjectExamsRemoteDatasourceImpl(this._apiClient);

  final SubjectExamApiClient _apiClient;
  @override
  Future<SubjectExamResponse> getSubjectExams(String subjectId) {
    return _apiClient.getSubjectExams(subjectId);
  }
}
