import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../../../core/constants/api_endpoints/api_query_params.dart';
import '../../data/models/exma_questions_response/exam_questions_response.dart';

part 'exam_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(ApiEndpoints.questionsEndPoint)
  Future<ExamQuestionsResponse> fetchExamQuestions({
    @Query(ApiQueryParams.examQuery) required String examId,
  });
}
