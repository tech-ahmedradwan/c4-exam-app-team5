sealed class ExploreSubjectsEvent {
  const ExploreSubjectsEvent();
}

final class FetchExploreSubjects extends ExploreSubjectsEvent {}

final class SearchInSubjects extends ExploreSubjectsEvent {
  SearchInSubjects({required this.value});

  final String value;
}

final class NavigateToSubjectExams extends ExploreSubjectsEvent {
  NavigateToSubjectExams({required this.subjectId});

  final String subjectId;
}
