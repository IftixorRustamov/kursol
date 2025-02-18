import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/my_course/presentation/widgets/lesson_list_widget.dart';

import '../../data/repositories/dummy_course_details.dart';
import 'certificate_page.dart';

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
        backgroundColor: isDarkMode ? AppColors.greyScale.grey900 : Colors.white,
        appBar: AppBar(
          title: Text(
            courseDetail.title,
            style: UrbanistTextStyles().bold(
              color: AppColors.black,
              fontSize: 22,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(IconlyLight.arrow_left, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.more_circle, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.primary.blue500,
            labelColor: AppColors.primary.blue500,
            unselectedLabelColor: Colors.grey,
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

              // 🟢 CERTIFICATES TAB (CertificateWidget qo'shildi)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary.blue500,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () async {
                      await generateCertificate();
                    },
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
            color: isDarkMode ? AppColors.greyScale.grey800 : Colors.white,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary.blue500,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
