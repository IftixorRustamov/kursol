import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/common/constants/colors/app_colors.dart';

class CompletedCourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final double progress;
  final Color progressColor;

  const CompletedCourseCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.progress,
    required this.progressColor, required Null Function() onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.push('/test-result', extra: {
          'testTitle': title,
          'testImage': imagePath,
          'correctAnswers': 43,
          'incorrectAnswers': 24,
          'unanswered': 2,
        });
      },
      child: Container(
        width: double.infinity,
        height: appH(140),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark2 : AppColors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? AppColors.background.dark3.withOpacity(0.3)
                  : AppColors.greyScale.grey300,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: EdgeInsets.all(appH(20)),
        margin: EdgeInsets.only(bottom: appH(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: appW(100), // CourseCard bilan bir xil rasm hajmi
                height: appH(100),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.urbanist.bold(
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: AppTextStyles.urbanist.medium(
                      color: AppColors.greyScale.grey700,
                      fontSize: 14, // CourseCard bilan bir xil matn hajmi
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            CircularPercentIndicator(
              radius: 40.0, // Indicator hajmi
              lineWidth: 10.0,
              percent: progress / 100,
              center: Text(
                "${progress.toInt()}%",
                style: AppTextStyles.urbanist.bold(
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  fontSize: 18, // Foiz shrift hajmi
                ),
              ),
              progressColor: progressColor,
              backgroundColor: AppColors.greyScale.grey300,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
