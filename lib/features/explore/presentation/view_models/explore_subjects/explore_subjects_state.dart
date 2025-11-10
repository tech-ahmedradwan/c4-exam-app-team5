part of 'explore_subjects_cubit.dart';

class ExploreSubjectsState extends Equatable {
  const ExploreSubjectsState({
    this.expolreSubjectsState = const BaseState<List<ExploreSubjectEntity>>(),
  });

  final BaseState<List<ExploreSubjectEntity>> expolreSubjectsState;

  ExploreSubjectsState copyWith({
    BaseState<List<ExploreSubjectEntity>>? expolreSubjectsState,
  }) {
    return ExploreSubjectsState(
      expolreSubjectsState: expolreSubjectsState ?? this.expolreSubjectsState,
    );
  }

  @override
  List<Object> get props => [expolreSubjectsState];
}
