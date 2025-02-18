import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/my_course/presentation/pages/video_player_page.dart';
import '../../data/repositories/dummy_course_details.dart';

class CourseDetailPage extends StatelessWidget {
  final String courseId;

  const CourseDetailPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final courseDetail = dummyCourseDetails.firstWhere((course) => course.id == courseId);

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.greyScale.grey900 : Colors.white,
      appBar: AppBar(
        title: Text(
          courseDetail.title,
          style: UrbanistTextStyles().bold(
            color: AppColors.black,
            fontSize: appH(22),
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left, size: appH(28), color: theme.iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(IconlyLight.more_circle, size: appH(28), color: theme.iconTheme.color),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: ListView(
          children: courseDetail.sections.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appH(18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      section.title,
                      style: UrbanistTextStyles().semiBold(
                        color: AppColors.greyScale.grey500,
                        fontSize: appH(18),
                      ),
                    ),
                    Text(
                      section.duration,
                      style: UrbanistTextStyles().semiBold(
                        color: AppColors.primary.blue500,
                        fontSize: appH(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appH(12)),
                Column(
                  children: section.lessons.map((lesson) {
                    return Container(
                      margin: EdgeInsets.only(bottom: appH(12)),
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.greyScale.grey800 : Colors.white,
                        borderRadius: BorderRadius.circular(appH(18)),
                        boxShadow: [
                          if (!isDarkMode)
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: appH(12),
                              offset: Offset(0, appH(4)),
                            ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary.blue100.withOpacity(0.2),
                          radius: appH(24),
                          child: Text(
                            lesson.id,
                            style: UrbanistTextStyles().bold(
                              color: AppColors.primary.blue500,
                              fontSize: appH(18),
                            ),
                          ),
                        ),
                        title: Text(
                          lesson.title,
                          style: UrbanistTextStyles().semiBold(
                            color: isDarkMode ? Colors.white : Colors.black87,
                            fontSize: appH(18),
                          ),
                        ),
                        subtitle: Text(
                          lesson.duration,
                          style: UrbanistTextStyles().regular(
                            color: Colors.grey,
                            fontSize: appH(16),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if (!lesson.isLocked) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                    videoUrl: "https://videos.pexels.com/video-files/7140928/7140928-uhd_2560_1440_24fps.mp4",
                                    title: lesson.title,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Icon(
                            lesson.isLocked ? IconlyLight.lock : IconlyBold.play,
                            size: appH(28),
                            color: lesson.isLocked ? AppColors.greyScale.grey500 : AppColors.primary.blue500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(appH(18)),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.greyScale.grey800 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: appH(12),
              offset: Offset(0, -appH(3)),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary.blue500,
            padding: EdgeInsets.symmetric(vertical: appH(16)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appH(30))),
          ),
          onPressed: () {
            context.push('/video-player', extra: {
              'videoUrl': 'https://www.pexels.com/video/close-up-of-a-cpu-7140928/',
              'title': courseDetail.title,
            });
          },
          child: Text(
            "Continue Course",
            style: UrbanistTextStyles().semiBold(
              color: Colors.white,
              fontSize: appH(16),
            ),
          ),
        ),
      ),
    );
  }
}
