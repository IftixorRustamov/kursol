import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/features/my_course/presentation/widgets/custom_bottom_bar_wg.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/my_course/presentation/widgets/sertificate_wg.dart';
import 'package:kursol/features/my_course/presentation/widgets/tab_bar_widget.dart';
import 'package:kursol/features/my_course/presentation/widgets/lesson_list_widget.dart';
import '../../data/repositories/dummy_course_details.dart';

class CompletedCoursePage extends StatefulWidget {
  final String courseId;

  const CompletedCoursePage({super.key, required this.courseId});

  @override
  // ignore: library_private_types_in_public_api
  _CompletedCoursePageState createState() => _CompletedCoursePageState();
}

class _CompletedCoursePageState extends State<CompletedCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String buttonText;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    buttonText = AppStrings.startCourseAgain;

    _tabController.addListener(() {
      setState(() {
        buttonText =
            _tabController.index == 1
                ? AppStrings.downloadCertificate
                : AppStrings.startCourseAgain;
      });
    });
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
        backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
        appBar: AppBar(
          title: Text(
            courseDetail.title,
            style: UrbanistTextStyles().bold(
              color: isDarkMode ? AppColors.white: AppColors.black,
              fontSize: 22,
            ),
          ),
          backgroundColor:
              isDarkMode ? AppColors.background.dark : AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              IconlyLight.arrow_left,
              color: isDarkMode ? AppColors.white : Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: CourseTabBar(
            tabController: _tabController,
            tabTitles: [AppStrings.lessons, AppStrings.certificates],
          ),
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
                  child: CertificateWidget(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          buttonText: buttonText,
          isDarkMode: isDarkMode,
          onPressed: () {},
        ),
      ),
    );
  }
}
