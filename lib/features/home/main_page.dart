import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:kursol/features/my_course/presentation/pages/my_course_page.dart';
import 'package:kursol/features/transaction/pages/transactions_page.dart';

import '../../core/common/constants/colors/app_colors.dart';
import '../../core/utils/responsiveness/app_responsive.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // home page
    MyCoursePage(),
    // inbox page
    TransactionsPage(),
    // profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: appH(90),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: appW(28),
          backgroundColor: AppColors.white,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primary(),
          unselectedItemColor: AppColors.greyScale.grey500,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedLabelStyle: AppTextStyles.urbanist.bold(
            color: AppColors.primary(),
            fontSize: 10,
          ),
          unselectedLabelStyle: AppTextStyles.urbanist.medium(
            color: AppColors.greyScale.grey500,
            fontSize: 10,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
              ),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 1 ? IconlyBold.document : IconlyLight.document,
              ),
              label: AppStrings.myCourses,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 2 ? IconlyBold.chat : IconlyLight.chat,
              ),
              label: AppStrings.inbox,
            ),
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 3 ? IconlyBold.buy : IconlyLight.buy),
              label: AppStrings.transactions,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 4 ? IconlyBold.profile : IconlyLight.profile,
              ),
              label: AppStrings.profile,
            ),
          ],
        ),
      ),
    );
  }
}
