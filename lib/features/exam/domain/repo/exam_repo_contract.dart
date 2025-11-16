import '../../../../config/base_response/base_response.dart';
import '../entity/answer_entity.dart';
import '../entity/exam_entity.dart';
import '../entity/question_entity.dart';

abstract class ExamRepoContract {
  Future<BaseResponse<ExamEntity>> fetchExamDetails(String examId);

  Future<BaseResponse<List<QuestionEntity>>> fetchExamQuestions(String examId);

  Future<BaseResponse<List<AnswerEntity>>> fetchExamAnswers(String examId);
}
