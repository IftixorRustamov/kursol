import 'package:flutter/material.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/utils/textstyles/urbanist_textstyles.dart';
import '../../../../my_course/domain/entities/course_detail.dart';
import '../../widgets/CourseLessonWidget.dart';

class LessonTab extends StatelessWidget {
  const LessonTab({
    super.key,
    required this.urbanistTextStyles,
    required this.isDarkMode,
    required this.courseDetail,
  });

  final UrbanistTextStyles urbanistTextStyles;
  final bool isDarkMode;
  final List<CourseSection> courseDetail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '124 Lessons',
                  style: urbanistTextStyles.bold(
                    fontSize: 20,
                    color:
                    isDarkMode
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: urbanistTextStyles.bold(
                      fontSize: 20,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            CourseLessonWidget(
              sections: courseDetail,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}
