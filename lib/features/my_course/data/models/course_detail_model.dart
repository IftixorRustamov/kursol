import '../../domain/entities/course_detail.dart';

class CourseDetailModel extends CourseDetail {
  CourseDetailModel({
    required super.id,
    required super.title,
    required super.sections,
  });

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
      id: json['id'],
      title: json['title'],
      sections: (json['sections'] as List)
          .map((section) => CourseSection(
        title: section['title'],
        duration: section['duration'],
        lessons: (section['lessons'] as List)
            .map((lesson) => Lesson(
          id: lesson['id'],
          title: lesson['title'],
          duration: lesson['duration'],
          isLocked: lesson['isLocked'],
        ))
            .toList(),
      ))
          .toList(),
    );
  }
}
