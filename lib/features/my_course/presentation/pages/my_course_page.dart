import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/default_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/navbar_wg.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import '../widgets/app_bar_widget.dart';
import '../../data/repositories/dummy_courses.dart';
import '../widgets/tab_bar_widget.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.greyScale.grey100,
      appBar: DefaultAppBarWg(
        titleText: AppStrings.myCourses,
        onMorePressed: () {},
      ),
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
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
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
