import '../../models/subject_exam_response/subject_exam_response.dart';

abstract class SubjectExamsRemoteDatasourceContract {
  Future<SubjectExamResponse> getSubjectExams(String subjectId);
}
