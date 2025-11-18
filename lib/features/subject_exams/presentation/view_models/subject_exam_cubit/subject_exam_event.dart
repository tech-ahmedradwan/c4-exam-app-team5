sealed class SubjectExamEvent {
  const SubjectExamEvent();
}

final class GetSubjectExams extends SubjectExamEvent {
  GetSubjectExams({required this.subjectId});

  final String subjectId;
}
