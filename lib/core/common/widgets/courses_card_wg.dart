import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utils/responsiveness/app_responsive.dart';
import '../../utils/textstyles/app_textstyles.dart';
import '../constants/colors/app_colors.dart';

class CoursesCardWg extends StatelessWidget {
  final VoidCallback onTap;
  final String courseName;
  final String courseImg;
  final String courseTime;

  const CoursesCardWg({
    super.key,
    required this.onTap,
    required this.courseImg,
    required this.courseName,
    required this.courseTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: appH(140),
        padding: EdgeInsets.all(appH(20)),
        margin: EdgeInsets.only(bottom: appH(20)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyScale.grey300,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          spacing: appW(16),
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                courseImg, // Replaced !!!
                width: appW(100),
                height: appH(100),
                fit: BoxFit.cover,
              ),
            ),

            // Course Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    courseName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.urbanist.bold(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    courseTime,
                    style: AppTextStyles.urbanist.medium(
                      color: AppColors.greyScale.grey700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Circular Progress Indicator
            CircularPercentIndicator(
              radius: 35.0,
              lineWidth: 8.0,
              percent: 0.5,
              center: Text(
                "50%",
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
              progressColor: AppColors.amber,
              backgroundColor: AppColors.greyScale.grey200,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
