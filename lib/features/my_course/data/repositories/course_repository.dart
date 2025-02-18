import '../models/course_model.dart';

abstract class CourseRepository {
  List<CourseModel> getOngoingCourses();
  List<CourseModel> getCompletedCourses();
}
