sealed class ExploreSubjectsEvent {
  const ExploreSubjectsEvent();
}

final class FetchExploreSubjects extends ExploreSubjectsEvent {}

final class SearchInSubjects extends ExploreSubjectsEvent {
  SearchInSubjects({required this.value});

  final String value;
}
