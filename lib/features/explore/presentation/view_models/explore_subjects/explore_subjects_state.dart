part of 'explore_subjects_cubit.dart';

class ExploreSubjectsState extends Equatable {
  const ExploreSubjectsState({
    this.expolreSubjectsState = const BaseState(),
    this.navigateToSubjectState = const BaseState(),
  });

  final BaseState<List<ExploreSubjectEntity>> expolreSubjectsState;
  final BaseState<String> navigateToSubjectState;

  ExploreSubjectsState copyWith({
    BaseState<List<ExploreSubjectEntity>>? expolreSubjectsState,
    BaseState<String>? navigateToSubjectState,
  }) {
    return ExploreSubjectsState(
      expolreSubjectsState: expolreSubjectsState ?? this.expolreSubjectsState,
      navigateToSubjectState:
          navigateToSubjectState ?? this.navigateToSubjectState,
    );
  }

  @override
  List<Object> get props => [expolreSubjectsState, navigateToSubjectState];
}
