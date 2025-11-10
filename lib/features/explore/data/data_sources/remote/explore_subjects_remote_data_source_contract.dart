import '../../models/explore_subjects_response/explore_subjects_response.dart';

abstract class ExploreSubjectsRemoteDataSourceContract {
  Future<ExploreSubjectsResponse> fetchExploreSubjects();
}
