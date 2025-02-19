import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../../utils/responsiveness/app_responsive.dart';
import '../../utils/textstyles/app_textstyles.dart';

class CourseCard extends StatelessWidget {
  final VoidCallback onTap;
  final String courseImg;
  final String courseTitle;
  final Widget subWidget;

  const CourseCard({
    super.key,
    required this.onTap,
    required this.courseImg,
    required this.courseTitle,
    required this.subWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: appH(140),
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
        padding: EdgeInsets.all(appH(20)),
        margin: EdgeInsets.only(bottom: appH(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: appW(16),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                courseImg, // Replaced !!!
                width: appW(100),
                height: appH(100),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    courseTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.urbanist.bold(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  subWidget,
                  Row(
                    children: [
                      LinearPercentIndicator(
                        width: appW(171),
                        lineHeight: 10.0,
                        percent: 40 / 100,
                        backgroundColor: Colors.grey[700],
                        progressColor: AppColors.amber,
                        barRadius: const Radius.circular(12),
                      ),
                      Text(
                        "${40} / 100",
                        style: AppTextStyles.urbanist.bold(
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
