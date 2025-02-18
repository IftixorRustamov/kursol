import '../../domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({
    required super.id, // ID qo‘shildi
    required super.title,
    required super.duration,
    required super.imageUrl,
    required super.progress,
  });

  // JSON dan model yaratish uchun yordamchi metod
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      imageUrl: json['imageUrl'] as String,
      progress: json['progress'] as int,
    );
  }

  // Modelni JSON formatga o‘tkazish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'imageUrl': imageUrl,
      'progress': progress,
    };
  }
}
