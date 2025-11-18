import '../../../domain/entity/explore_subject_entity.dart';

sealed class ExploreSubjectsEvent {
  const ExploreSubjectsEvent();
}

final class FetchExploreSubjects extends ExploreSubjectsEvent {}

final class SearchInSubjects extends ExploreSubjectsEvent {
  SearchInSubjects({required this.value});

  final String value;
}

final class NavigateToSubjectExams extends ExploreSubjectsEvent {
  NavigateToSubjectExams({required this.subject});

  final ExploreSubjectEntity subject;
}
