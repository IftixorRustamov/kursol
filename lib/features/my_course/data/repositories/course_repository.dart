import 'package:kursol/features/my_course/domain/entities/course.dart';


abstract class CourseRepository {
  List<Course> getOngoingCourses();
  List<Course> getCompletedCourses();
  Future<Course> getCourseById(String courseId);
}
