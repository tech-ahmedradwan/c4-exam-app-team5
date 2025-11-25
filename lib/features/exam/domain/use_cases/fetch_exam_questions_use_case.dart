import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/question_entity.dart';
import '../repo/exam_repo_contract.dart';

@injectable
class FetchExamQuestionsUseCase {
  FetchExamQuestionsUseCase(this._examRepo);

  final ExamRepoContract _examRepo;

  Future<BaseResponse<List<QuestionEntity>>> call({required String examId}) =>
      _examRepo.fetchExamQuestions(examId);
}
