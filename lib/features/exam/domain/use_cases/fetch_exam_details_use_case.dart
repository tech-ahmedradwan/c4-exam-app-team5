import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/exam_entity.dart';
import '../repo/exam_repo_contract.dart';

@injectable
class FetchExamDetailsUseCase {
  FetchExamDetailsUseCase(this._examRepo);

  final ExamRepoContract _examRepo;

  Future<BaseResponse<ExamEntity>> call(String examId) =>
      _examRepo.fetchExamDetails(examId);
}
