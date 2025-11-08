import '../../../../config/base_response/base_response.dart';
import '../entity/explore_subject_entity.dart';

abstract class ExploreSubjectsReposContract {
  Future<BaseResponse<List<ExploreSubjectEntity>>> fetchExploreSubjects();
}
