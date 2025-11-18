import '../../../../config/base_response/base_response.dart';
import '../entity/subject_exam_entity.dart';

abstract class SubjectExamRepoContract {
  Future<BaseResponse<List<SubjectExamEntity>>> getSubjectExams(
    String subjectId,
  );
}
