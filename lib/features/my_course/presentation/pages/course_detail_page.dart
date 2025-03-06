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
      backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          courseDetail.title,
          style: UrbanistTextStyles().bold(
            color: isDarkMode ? Colors.white : AppColors.black,
            fontSize: appH(22),
          ),
        ),
        backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            size: appH(28),
            color: isDarkMode ? Colors.white : Colors.black,
          ),
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
          borderRadius: BorderRadius.circular(10),
          color: isDarkMode ? AppColors.background.dark : Colors.white,
          border: Border.all(
            color: isDarkMode ? AppColors.greyScale.grey700 : AppColors.greyScale.grey300,
            width: 0.4,
          ),
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
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

              context.push('/completed-courses');
            } else {

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
