import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/explore_subject_entity.dart';
import '../repos/expolre_subjects_repos_contract.dart';

@injectable
class FetchExploreSubjectsUseCase {
  FetchExploreSubjectsUseCase(this._exploreSubjectsReposContract);

  final ExploreSubjectsReposContract _exploreSubjectsReposContract;

  Future<BaseResponse<List<ExploreSubjectEntity>>> call() =>
      _exploreSubjectsReposContract.fetchExploreSubjects();
}
