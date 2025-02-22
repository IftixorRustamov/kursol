import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

class CourseTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> tabTitles;

  const CourseTabBar({super.key, required this.tabController, required this.tabTitles})
      : assert(tabTitles.length > 1, 'TabBar kamida 2 ta tabga ega bo‘lishi kerak');

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TabBar(
      controller: tabController,
      indicatorColor: AppColors.primary.blue500,
      labelColor: AppColors.primary.blue500,
      unselectedLabelColor: isDarkMode ? AppColors.greyScale.grey400 : Colors.grey,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      tabs: tabTitles.map((title) => Tab(text: title)).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
