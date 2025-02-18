class CourseDetail {
  final String id;
  final String title;
  final List<CourseSection> sections;

  CourseDetail({required this.id, required this.title, required this.sections});
}

class CourseSection {
  final String title;
  final String duration;
  final List<Lesson> lessons;

  CourseSection({required this.title, required this.duration, required this.lessons});
}

class Lesson {
  final String id;
  final String title;
  final String duration;
  final bool isLocked;

  Lesson({required this.id, required this.title, required this.duration, required this.isLocked});
}
