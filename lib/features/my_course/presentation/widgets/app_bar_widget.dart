import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/icons/logo.png',
            height: 30,
          ),
          const SizedBox(width: 8),
          Text(
            'My Courses',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(IconlyLight.search, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(IconlyLight.more_circle, color: isDarkMode ? AppColors.white : AppColors.background.dark),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        indicatorColor: AppColors.primary.blue500,
        labelColor: AppColors.primary.blue500,
        unselectedLabelColor: isDarkMode ? AppColors.greyScale.grey400 : Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        tabs: const [
          Tab(text: "Ongoing"),
          Tab(text: "Completed"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);
}
