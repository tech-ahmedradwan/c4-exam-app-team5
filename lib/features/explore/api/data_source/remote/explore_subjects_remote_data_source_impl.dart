import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/explore_subjects_remote_data_source_contract.dart';
import '../../../data/models/explore_subjects_response/explore_subjects_response.dart';
import '../../api_client/explore_api_client.dart';

@Injectable(as: ExploreSubjectsRemoteDataSourceContract)
class ExploreSubjectsRemoteDataSourceImpl
    extends ExploreSubjectsRemoteDataSourceContract {
  ExploreSubjectsRemoteDataSourceImpl(this._exploreApiClient);

  final ExploreApiClient _exploreApiClient;
  @override
  Future<ExploreSubjectsResponse> fetchExploreSubjects() async {
    return await _exploreApiClient.fetchAllSubject();
  }
}
