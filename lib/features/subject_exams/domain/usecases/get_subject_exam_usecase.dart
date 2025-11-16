import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/subject_exam_entity.dart';
import '../repos/subject_exam_repo_contract.dart';

@injectable
class GetSubjectExamUsecase {
  GetSubjectExamUsecase(this._repo);

  final SubjectExamRepoContract _repo;
  Future<BaseResponse<List<SubjectExamEntity>>> call(String subjectId) {
    return _repo.getSubjectExams(subjectId);
  }
}
