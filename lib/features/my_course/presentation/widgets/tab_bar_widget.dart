import 'package:flutter/material.dart';
import '../../../../core/common/constants/colors/app_colors.dart';


class CourseTabBar extends StatelessWidget {
  final TabController tabController;

  const CourseTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    double indicatorWidth = screenWidth * 0.4;
    double tabPadding = screenWidth * 0.05;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDarkMode ? AppColors.darkGrey : AppColors.gray200,
                width: 1.5,
              ),
            ),
          ),
          child: TabBar(
            controller: tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.gray500,
            indicatorColor: Colors.transparent,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Urbanist',
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Urbanist',
            ),
            tabs: const [Tab(text: 'Ongoing'), Tab(text: 'Completed')],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tabPadding),
          child: AnimatedBuilder(
            animation: tabController.animation ?? AlwaysStoppedAnimation(0),
            builder: (context, child) {
              double animationValue = tabController.animation?.value ?? 0.0;
              double progressLeft =
                  animationValue *
                  (screenWidth - 2 * tabPadding - indicatorWidth);

              return Stack(
                children: [
                  Container(
                    height: 4,
                    width: double.infinity,
                    color: AppColors.gray300,
                  ),

                  Positioned(
                    left: progressLeft,
                    child: Container(
                      height: 4,
                      width: indicatorWidth,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
