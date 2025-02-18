import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/features/my_course/presentation/pages/video_player_page.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
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
      backgroundColor: isDarkMode ? AppColors.dark1 : Colors.white,
      appBar: AppBar(
        title: Text(
          courseDetail.title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            size: 28,
            color: theme.iconTheme.color,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyLight.more_circle,
              size: 28,
              color: theme.iconTheme.color,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: courseDetail.sections.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      section.title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.gray500,
                      ),
                    ),
                    Text(
                      section.duration,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: section.lessons.map((lesson) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.dark2 : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          if (!isDarkMode)
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          // ignore: deprecated_member_use
                          backgroundColor: AppColors.primary.withOpacity(0.2),
                          radius: 24,
                          child: Text(
                            lesson.id,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                        title: Text(
                          lesson.title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          lesson.duration,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if (!lesson.isLocked) {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                    videoUrl: "https://www.pexels.com/download/video/7140928/",
                                    title: lesson.title,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Image.asset(
                            lesson.isLocked ? 'assets/icons/lock.png' : 'assets/icons/play.png',
                            width: 48,
                            height: 48,
                            color: lesson.isLocked ? AppColors.gray500 : AppColors.primary,
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
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.dark2 : Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {

            context.push('/video-player', extra: {
              'videoUrl': 'https://www.pexels.com/download/video/7140928/',
              'title': courseDetail.title,
            });
          },
          child: const Text(
            "Continue Course",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
