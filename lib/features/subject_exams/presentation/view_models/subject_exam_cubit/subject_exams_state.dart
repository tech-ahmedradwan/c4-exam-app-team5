part of 'subject_exams_cubit.dart';

class SubjectExamsState extends Equatable {
  const SubjectExamsState({
    this.subjectExamState = const BaseState<List<SubjectExamEntity>>(),
  });

  final BaseState<List<SubjectExamEntity>> subjectExamState;
  SubjectExamsState copyWith({
    BaseState<List<SubjectExamEntity>>? subjectExamState,
  }) {
    return SubjectExamsState(
      subjectExamState: subjectExamState ?? this.subjectExamState,
    );
  }

  @override
  List<Object?> get props => [subjectExamState];
}
