import 'package:flutter/material.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../widgets/app_bar_widget.dart';
import '../../data/repositories/dummy_courses.dart';
import '../widgets/course_card.dart';
import '../widgets/tab_bar_widget.dart';

import '../widgets/bottom_nav_bar_widget.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1; // Default: "My Course"

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkCardBackground : AppColors.lightCardBackground,
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
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}

class CourseListView extends StatelessWidget {
  final bool isCompleted;

  const CourseListView({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final courses = isCompleted ? completedCourses : ongoingCourses;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return CourseCard(course: course);
      },
    );
  }
}
