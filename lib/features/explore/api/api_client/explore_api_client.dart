import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../data/models/explore_subjects_response/explore_subjects_response.dart';

part 'explore_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(Dio dio) = _ExploreApiClient;

  @GET(ApiEndpoints.exploreSubjectsEndPoint)
  Future<ExploreSubjectsResponse> fetchAllSubject();
}
