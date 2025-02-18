import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/features/my_course/domain/entities/course.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../core/common/constants/colors/app_colors.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  Color getProgressColor(int progress) {
    if (progress < 50) {
      return AppColors.progressLow;
    } else if (progress < 60) {
      return AppColors.progressMediumLow;
    } else if (progress < 75) {
      return AppColors.progressMediumHigh;
    } else if (progress < 100) {
      return AppColors.progressHigh;
    } else {
      return AppColors.progressComplete;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final completedLessons = course.progress;
    final totalLessons = 114;

    return GestureDetector(
      onTap: () {
        if (completedLessons == totalLessons) {
          context.push('/completed-courses');
        } else {
          context.push('/course-detail/${course.id}');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark2: Colors.white, // Dark Mode va Light Mode uchun fon rangi
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                course.imageUrl,
                width: screenWidth * 0.22,
                height: screenWidth * 0.22,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black, // Dark Mode uchun matn oq bo'ladi
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    course.duration,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDarkMode ? AppColors.greyScale.grey400 : AppColors.greyScale.grey700, // Dark Mode va Light Mode uchun rang moslashdi
                    ),
                  ),
                  const SizedBox(height: 10),
                  LinearPercentIndicator(
                    lineHeight: 10.0,
                    percent: completedLessons / totalLessons,
                    backgroundColor: isDarkMode ? AppColors.greyScale.grey700 : AppColors.greyScale.grey300, // Progress bar foni
                    progressColor: getProgressColor(completedLessons), // Progress bar to‘lish rangi
                    barRadius: const Radius.circular(12),
                  ),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$completedLessons / $totalLessons",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? Colors.white : Colors.black, // Dark Mode uchun oq rang
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
