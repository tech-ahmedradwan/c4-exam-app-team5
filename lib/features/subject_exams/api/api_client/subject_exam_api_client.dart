import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../../../core/constants/api_endpoints/api_keys.dart';
import '../../data/models/subject_exam_response/subject_exam_response.dart';

part 'subject_exam_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class SubjectExamApiClient {
  @factoryMethod
  factory SubjectExamApiClient(Dio dio) = _SubjectExamApiClient;
  @GET(ApiEndpoints.subjectExamsEndPoint)
  Future<SubjectExamResponse> getSubjectExams(
    @Query(ApiKeys.subject) String subjectId,
  );
}
