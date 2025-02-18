import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/my_course/presentation/widgets/lesson_list_widget.dart';
import '../../data/repositories/dummy_course_details.dart';
import '../../data/models/course_model.dart';
import '../../data/repositories/dummy_courses.dart';

class CourseDetailPage extends StatelessWidget {
  final String courseId;

  const CourseDetailPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final courseDetail = dummyCourseDetails.firstWhere((course) => course.id == courseId);
    final course = completedCourses.firstWhere(
          (course) => course.id == courseId,
      orElse: () => CourseModel(id: '', title: '', duration: '', imageUrl: '', progress: 0),
    );

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.greyScale.grey900 : Colors.white,
      appBar: AppBar(
        title: Text(
          courseDetail.title,
          style: UrbanistTextStyles().bold(
            color: AppColors.black,
            fontSize: appH(22),
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left, size: appH(28), color: theme.iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: SingleChildScrollView(
          child: LessonListWidget(
            sections: courseDetail.sections,
            isDarkMode: isDarkMode,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(appH(18)),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.greyScale.grey800 : Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.05),
              blurRadius: appH(12),
              offset: Offset(0, -appH(3)),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary.blue500,
            padding: EdgeInsets.symmetric(vertical: appH(16)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appH(30))),
          ),
          onPressed: () {
            if (course.progress == 100) {
              // Agar kurs 100% bo'lsa, CompletedCoursePage ga o'tish
              context.push('/completed-courses');
            } else {
              // Video sahifasiga o'tish
              context.push('/video-player', extra: {
                'videoUrl': 'https://www.pexels.com/video/close-up-of-a-cpu-7140928/',
                'title': courseDetail.title,
              });
            }
          },
          child: Text(
            course.progress == 100 ? "View Completed Course" : "Continue Course",
            style: UrbanistTextStyles().semiBold(
              color: Colors.white,
              fontSize: appH(16),
            ),
          ),
        ),
      ),
    );
  }
}
