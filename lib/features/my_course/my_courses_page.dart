import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/constants/theme/light_theme.dart';
import 'package:kursol/core/common/widgets/courses_card_wg.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../config/gen/assets.gen.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: lightTheme.appBarTheme.backgroundColor,
        leading: Assets.images.logo.image(),
        title: Text(
          AppStrings.myCourses,
          style: AppTextStyles.urbanist.bold(
            color: AppColors.black,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.search, size: appH(28)),
            color: AppColors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
            color: AppColors.black,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24)),
        child: Column(
          children: [
            // Segmented Control
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = 0),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.ongoing,
                          style: AppTextStyles.urbanist.semiBold(
                            color:
                                selectedIndex == 0
                                    ? AppColors.primary()
                                    : AppColors.greyScale(),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: appH(12)),
                        if (selectedIndex == 0)
                          Container(height: 2, color: AppColors.primary()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = 1),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.completed,
                          style: AppTextStyles.urbanist.semiBold(
                            color:
                                selectedIndex == 1
                                    ? AppColors.primary()
                                    : AppColors.greyScale(),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: appH(12)),
                        if (selectedIndex == 1)
                          Container(height: 2, color: AppColors.primary()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: appH(24)),
                itemCount: 4,
                itemBuilder:
                    (context, index) => CoursesCardWg(
                      onTap: () {},
                      courseImg: 'assets/images/img.png',
                      courseName: "WordPress Website Dev...",
                      courseTime: "3 hrs 15 mins",
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
