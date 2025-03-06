import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/common/widgets/widgets_export.dart';
import '../../../../core/utils/utils_export.dart';
import '../../data/repositories/dummy_courses.dart';

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
    return Scaffold(
      appBar: DefaultAppBarWg(
        titleText: AppStrings.myCourses,
        onMorePressed: () {},
      ),
      body: Column(
        children: [
          CustomTabBar(
            tabController: _tabController,
            tabTitles: [AppStrings.ongoing, AppStrings.completed],
          ),
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

        return CourseCard(
          onTap: () {
            if (isCompleted) {
              context.push('/completed-course/${course.id}');
            } else {
              context.push('/course-detail/${course.id}');
            }
          },
          courseImg: course.imageUrl,
          courseTitle: course.title,
          subWidget: Text(
            course.duration,
            style: AppTextStyles.urbanist.medium(
              color: AppColors.greyScale.grey700,
              fontSize: 14,
            ),
          ),
          courseDuration: '40 / 114',
        );
      },
    );
  }
}
