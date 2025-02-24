import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

// ignore: must_be_immutable
class CourseInfoWidget extends StatelessWidget {
  final Icon icon;
  final String title;

  const CourseInfoWidget({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();

    return Row(
      children: [
        icon,
        SizedBox(width: 5),
        Text(
          title,
          style: urbanistTextStyles.bold(
            fontSize: 16,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
        ),
      ],
    );
  }
}
