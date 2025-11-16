import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/subject_exam_entity.dart';
import '../../../domain/usecases/get_subject_exam_usecase.dart';
import 'subject_exam_event.dart';

part 'subject_exams_state.dart';

@injectable
class SubjectExamsCubit extends Cubit<SubjectExamsState> {
  SubjectExamsCubit(this._examUsecase) : super(const SubjectExamsState());
  final GetSubjectExamUsecase _examUsecase;
  doIntent(SubjectExamEvent event) {
    switch (event) {
      case GetSubjectExams():
        _getExams(event.subjectId);
    }
  }

  _getExams(String subjectId) async {
    emit(state.copyWith(subjectExamState: const BaseState(isLoading: true)));
    final result = await _examUsecase(subjectId);
    result.when(
      onSuccess: (onSuccess) =>
          emit(state.copyWith(subjectExamState: BaseState(data: onSuccess))),
      onError: (onError) => emit(
        state.copyWith(
          subjectExamState: BaseState(errorMessage: onError.message),
        ),
      ),
    );
  }
}
