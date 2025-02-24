import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/video_player_wg.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/course_details/presentation/pages/course_deatils_tabs/reviews_tab.dart';
import 'package:kursol/features/course_details/presentation/widgets/course_info_widget.dart';
import 'package:kursol/features/my_course/domain/entities/course_detail.dart';
import '../../../my_course/data/repositories/dummy_course_details.dart';
import 'course_deatils_tabs/about_tab.dart';
import 'course_deatils_tabs/lesson_tab.dart';

class CourseDetailsPage extends StatefulWidget {
  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();
    List<CourseSection> courseDetail = dummyCourseDetails
        .firstWhere((course) => course.id == '1')
        .sections;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Course Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomVideoPlayer(
                    videoUrl:
                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intro to UI/UX Design',
                        style: urbanistTextStyles.bold(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: 32,
                        ),
                      ),
                      Icon(IconlyLight.bookmark, color: AppColors.blue),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.lightBlue,
                        ),
                        child: Text(
                            'UI/UX Design', style: urbanistTextStyles.bold(
                          color: AppColors.white,
                          fontSize: 10,
                        )),
                      ),
                      Icon(IconlyBold.star, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text(
                        '4.8 (4,479 reviews)',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$40',
                        style: urbanistTextStyles.bold(
                          color: AppColors.blue,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '\$75',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blueGrey,
                          decoration: TextDecoration.lineThrough,
                          fontFamily: "Urbanist",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CourseInfoWidget(
                        icon: Icon(
                          IconlyBold.user_3,
                          color: AppColors.blue,
                          size: 20,
                        ),
                        title: '9,839 Students',
                      ),
                      CourseInfoWidget(
                        icon: Icon(
                          IconlyBold.time_circle,
                          color: AppColors.blue,
                          size: 16,
                        ),
                        title: '2.5 Hours',
                      ),
                      CourseInfoWidget(
                        icon: Icon(
                          IconlyBold.document,
                          color: AppColors.blue,
                          size: 20,
                        ),
                        title: 'Certificate',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tabs
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'About',),
                Tab(text: 'Lessons'),
                Tab(text: 'Reviews'),
              ],
            ),
            // TabBarView
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 200,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // About Tab
                  AboutTab(urbanistTextStyles: urbanistTextStyles, isDarkMode: isDarkMode),
                  // Lessons Tab
                  LessonTab(urbanistTextStyles: urbanistTextStyles, isDarkMode: isDarkMode, courseDetail: courseDetail),
                  // Reviews Tab
                  ReviewsTab(),
                ],
              ),
            ),
            // Enroll Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Enroll Course - \$440",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




