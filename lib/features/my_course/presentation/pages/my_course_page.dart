import 'package:flutter/material.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/app_bar/default_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/navbar_wg.dart';
import '../widgets/app_bar_widget.dart';
import '../../data/repositories/dummy_courses.dart';
import '../widgets/tab_bar_widget.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
// Default: "My Course"

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDarkMode
              ? AppColors.greyScale.grey900
              : AppColors.greyScale.grey100,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CourseTabBar(tabController: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CourseListView(isCompleted: false),
                CourseListView(isCompleted: true),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}

class CourseListView extends StatelessWidget {
  final bool isCompleted;

  const CourseListView({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final courses = isCompleted ? completedCourses : ongoingCourses;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.greyScale.grey800 : AppColors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              if (!isDarkMode)
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: AppColors.greyScale.grey300.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: CourseCard(course: course),
        );
      },
    );
  }
}
