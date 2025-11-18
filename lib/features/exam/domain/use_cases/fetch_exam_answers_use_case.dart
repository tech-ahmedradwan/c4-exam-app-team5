import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/answer_entity.dart';
import '../repo/exam_repo_contract.dart';

@injectable
class FetchExamAnswersUseCase {
  FetchExamAnswersUseCase(this._examRepo);

  final ExamRepoContract _examRepo;

  Future<BaseResponse<List<AnswerEntity>>> call(String examId) =>
      _examRepo.fetchExamAnswers(examId);
}
