import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

class CourseTabBar extends StatelessWidget {
  final TabController tabController;

  const CourseTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = AppResponsive.screenWidth;
    double indicatorWidth = appW(140); // Responsiv indikator eni
    double tabPadding = appW(20); // Responsiv ichki padding
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDarkMode ? AppColors.greyScale.grey600 : AppColors.greyScale.grey300,
                width: appH(1.5),
              ),
            ),
          ),
          child: TabBar(
            controller: tabController,
            labelColor: AppColors.primary.blue500,
            unselectedLabelColor: AppColors.greyScale.grey500,
            indicatorColor: Colors.transparent,
            labelStyle: UrbanistTextStyles().semiBold(
              color: AppColors.primary.blue500,
              fontSize: appH(16),
            ),
            unselectedLabelStyle: UrbanistTextStyles().medium(
              color: AppColors.greyScale.grey500,
              fontSize: appH(16),
            ),
            tabs: const [
              Tab(text: 'Ongoing'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tabPadding),
          child: AnimatedBuilder(
            animation: tabController.animation ?? AlwaysStoppedAnimation(0),
            builder: (context, child) {
              double animationValue = tabController.animation?.value ?? 0.0;
              double progressLeft =
                  animationValue * (screenWidth - 2 * tabPadding - indicatorWidth);
              return Stack(
                children: [
                  Container(
                    height: appH(4),
                    width: double.infinity,
                    color: AppColors.greyScale.grey300,
                  ),
                  Positioned(
                    left: progressLeft,
                    child: Container(
                      height: appH(4),
                      width: indicatorWidth,
                      decoration: BoxDecoration(
                        color: AppColors.primary.blue500,
                        borderRadius: BorderRadius.circular(appH(50)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: appH(10)),
      ],
    );
  }
}
