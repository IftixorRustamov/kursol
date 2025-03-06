import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/routes/route_paths.dart';

import '../../core/common/constants/constants_export.dart';
import '../../core/utils/utils_export.dart';

class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  static List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.home),
      activeIcon: Icon(IconlyBold.home),
      label: AppStrings.home,
      initialLocation: RoutePaths.home,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.document),
      activeIcon: Icon(IconlyBold.document),
      label: AppStrings.myCourses,
      initialLocation: RoutePaths.myCourse,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.chat),
      activeIcon: Icon(IconlyBold.chat),
      label: AppStrings.test,
      initialLocation: RoutePaths.test,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.buy),
      activeIcon: Icon(IconlyBold.buy),
      label: AppStrings.transactions,
      initialLocation: RoutePaths.transactions,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.profile),
      activeIcon: Icon(IconlyBold.profile),
      label: AppStrings.profile,
      initialLocation: RoutePaths.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void goOtherTab(BuildContext context, int index) {
      if (index == _currentIndex) return;

      GoRouter router = GoRouter.of(context);
      String location = tabs[index].initialLocation;

      if (index == 4) {
        router.replace(location);
      } else {
        router.go(location);
      }

      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: widget.child,
      bottomNavigationBar: SizedBox(
        height: appH(95),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: appW(28),
          backgroundColor: AppColors.white,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primary(),
          unselectedItemColor: AppColors.greyScale.grey500,
          onTap: (int index) => goOtherTab(context, index),
          selectedLabelStyle: AppTextStyles.urbanist.bold(
            color: AppColors.primary(),
            fontSize: 10,
          ),
          unselectedLabelStyle: AppTextStyles.urbanist.medium(
            color: AppColors.greyScale.grey500,
            fontSize: 10,
          ),
          items: List<BottomNavigationBarItem>.from(tabs),
        ),
      ),
    );
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem({
    required this.initialLocation,
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(activeIcon: activeIcon ?? icon);
}
