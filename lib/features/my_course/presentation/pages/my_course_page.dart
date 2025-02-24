import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import '../../../../core/common/constants/strings/strings.dart';
import '../../../../core/common/widgets/app_bar/default_app_bar_wg.dart';
import '../../../../core/common/widgets/custom_tab_bar_wg.dart';
import '../../../../core/utils/textstyles/app_textstyles.dart';
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
            tabTitles: ["Ongoing", "Completed"],
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
    final courses = ongoingCourses;
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return CourseCard(
          onTap: () {
            context.push('/course-detail/${course.id}');
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
        );
      },
    );
  }
}
