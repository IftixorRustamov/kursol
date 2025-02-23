import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/my_course/presentation/widgets/lesson_list_widget.dart';
import '../../../../core/common/widgets/custom_tab_bar_wg.dart';
import '../../data/repositories/dummy_course_details.dart';

class CompletedCoursePage extends StatefulWidget {
  final String courseId;

  const CompletedCoursePage({super.key, required this.courseId});

  @override
  _CompletedCoursePageState createState() => _CompletedCoursePageState();
}

class _CompletedCoursePageState extends State<CompletedCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final courseDetail = dummyCourseDetails.firstWhere(
          (course) => course.id == widget.courseId,
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
          backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(IconlyLight.arrow_left, color: isDarkMode ? Colors.white : Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: CustomTabBar(tabController: _tabController, tabTitles: ["Lessons", "Certificates"],),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            controller: _tabController,
            children: [
              // Lessons Tab
              SingleChildScrollView(
                child: LessonListWidget(
                  sections: courseDetail.sections,
                  isDarkMode: isDarkMode,
                ),
              ),
              // Certificates Tab
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary.blue500,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Download Certificate",
                    style: UrbanistTextStyles().semiBold(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: isDarkMode ? AppColors.background.dark : Colors.white,
              border: Border.all(
                color: isDarkMode ? AppColors.greyScale.grey700 : AppColors.greyScale.grey300,
                width: 0.4,
              ),
              boxShadow: [
                if (!isDarkMode)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: Offset(0, -3),
                  ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary.blue500,
                padding: EdgeInsets.symmetric(vertical: 16),
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
      ),
    );
  }
}
