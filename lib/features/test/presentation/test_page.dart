import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';
import 'package:kursol/features/test/widgets/completed_card.dart';

import '../../../core/common/constants/constants_export.dart';
import '../../../core/common/widgets/widgets_export.dart';
import '../../../core/utils/utils_export.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
      appBar: DefaultAppBarWg(
        titleText: AppStrings.test,
        onMorePressed: () {},
      ),
      body: Column(
        children: [
          CustomTabBar(
            tabController: _tabController,
            tabTitles: [AppStrings.avaibleTests, AppStrings.completedTests],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CourseListView(isCompleted: false), // Available tests
                CourseListView(isCompleted: true), // Completed tests
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
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: isCompleted
          ? [
              CompletedCourseCard(
                imagePath: 'assets/courses/dtm.png',
                title: 'DTM',
                duration: '2 hrs 30 mins',
                progress: 50,
                progressColor: AppColors.progressHigh,
                onTap: () {
                  context.push('/testDetail', extra: {'testTitle': 'DTM'});
                },
              ),
              CompletedCourseCard(
                imagePath: 'assets/courses/sat.png',
                title: 'SAT',
                duration: '3 hrs 15 mins',
                progress: 75,
                progressColor: AppColors.progressMediumLow,
                onTap: () {
                  context.push('/TestDetail', extra: {'testTitle': 'SAT'});
                },
              ),
              CompletedCourseCard(
                imagePath: 'assets/courses/ielts.png',
                title: 'IELTS',
                duration: '2 hrs 48 mins',
                progress: 95,
                progressColor: AppColors.progressLow,
                onTap: () {
                  context.go('/TestDetail', extra: {'testTitle': 'DTM'});
                },
              ),
            ]
          : [
              CourseCard(
                onTap: () {
                  context.push('/TestDetail', extra: {'testTitle': 'DTM'});
                },
                courseImg: 'assets/courses/dtm.png',
                courseTitle: 'DTM',
                subWidget: Text(
                  'Davlat Test Markazi',
                  style: AppTextStyles.urbanist.medium(
                    color: AppColors.greyScale.grey700,
                    fontSize: 14,
                  ),
                ),
                courseDuration: '90 ta savol',
              ),
              CourseCard(
                onTap: () {
                  context.push('/TestDetail', extra: {'testTitle': 'SAT'});
                },
                courseImg: 'assets/courses/sat.png',
                courseTitle: 'SAT',
                subWidget: Text(
                  'Akademik ingliz tili va matematika',
                  style: AppTextStyles.urbanist.medium(
                    color: AppColors.greyScale.grey700,
                    fontSize: 14,
                  ),
                ),
                courseDuration: '100 ta savol',
              ),
              CourseCard(
                onTap: () {
                  context.go('/TestDetail', extra: {'testTitle': 'DTM'});
                },
                courseImg: 'assets/courses/ielts.png',
                courseTitle: 'IELTS',
                subWidget: Text(
                  'Reading, Listening, Writing, Speaking',
                  style: AppTextStyles.urbanist.medium(
                    color: AppColors.greyScale.grey700,
                    fontSize: 14,
                  ),
                ),
                courseDuration: '40 ta savol',
              ),
              CourseCard(
                onTap: () {
                  context.push('/TestDetail', extra: {'testTitle': 'Avtotest'});
                },
                courseImg: 'assets/courses/avtotest.png',
                courseTitle: 'Avtotest',
                subWidget: Text(
                  'Yo‘l harakati qoidalari',
                  style: AppTextStyles.urbanist.medium(
                    color: AppColors.greyScale.grey700,
                    fontSize: 14,
                  ),
                ),
                courseDuration: '75 ta savol',
              ),
            ],
    );
  }
}
