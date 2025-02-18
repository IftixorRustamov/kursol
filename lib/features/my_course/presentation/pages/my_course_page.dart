import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/navbar_wg.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import '../widgets/app_bar_widget.dart';
import '../../data/repositories/dummy_courses.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: const [
              CourseListView(isCompleted: false),
              CourseListView(isCompleted: true),
            ],
          ),
        ),
        bottomNavigationBar: NavbarWidget(),
      ),
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

    return Container(
      color: isDarkMode ? AppColors.background.dark : AppColors.greyScale.grey200, // List fon rangi
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CourseCard(course: course),
          );
        },
      ),
    );
  }
}
