import '../../../../config/base_response/base_response.dart';
import '../entity/question_entity.dart';

abstract interface class ExamRepoContract {
  Future<BaseResponse<List<QuestionEntity>>> fetchExamQuestions(String examId);
}
