import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/my_course/presentation/widgets/lesson_list_widget.dart';

import '../../data/repositories/dummy_course_details.dart';

class CompletedCoursePage extends StatelessWidget {
  final String courseId;

  const CompletedCoursePage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final courseDetail = dummyCourseDetails.firstWhere(
          (course) => course.id == courseId,
      orElse: () => dummyCourseDetails.first,
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
        appBar: AppBar(
          title: Text(
            courseDetail.title,
            style: UrbanistTextStyles().bold(
              color: isDarkMode ? Colors.white : AppColors.black,
              fontSize: 22,
            ),
          ),
          backgroundColor: isDarkMode ? AppColors.background.dark2 : Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(IconlyLight.arrow_left, color: isDarkMode ? Colors.white : Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(IconlyLight.more_circle, color: isDarkMode ? Colors.white : Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.primary.blue500,
            labelColor: AppColors.primary.blue500,
            unselectedLabelColor: isDarkMode ? AppColors.greyScale.grey400 : Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            tabs: const [
              Tab(text: "Lessons"),
              Tab(text: "Certificates"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: [
              // 🟢 LESSONS TAB
              SingleChildScrollView(
                child: LessonListWidget(
                  sections: courseDetail.sections,
                  isDarkMode: isDarkMode,
                ),
              ),

              // 🟢 CERTIFICATES TAB
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary.blue500,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () async {},
                    child: Text(
                      "Download Certificate",
                      style: UrbanistTextStyles().semiBold(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
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
            onPressed: () {},
            child: Text(
              "Start Course Again",
              style: UrbanistTextStyles().semiBold(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
