import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import '../../routes/route_names.dart';
import '../constants/colors/app_colors.dart' show AppColors;

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = _getCurrentIndex(context);

    // Dark Mode tekshirish
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: AppColors.primary.blue500,
      unselectedItemColor: AppColors.greyScale.grey500,
      showUnselectedLabels: true,
      backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(currentIndex == 0 ? IconlyBold.home : IconlyLight.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(currentIndex == 1 ? IconlyBold.document : IconlyLight.document),
          label: 'My Course',
        ),
        BottomNavigationBarItem(
          icon: Icon(currentIndex == 2 ? IconlyBold.chat : IconlyLight.chat),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(currentIndex == 3 ? IconlyBold.buy : IconlyLight.buy),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(currentIndex == 4 ? IconlyBold.profile : IconlyLight.profile),
          label: 'Profile',
        ),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location == RouteNames.home) return 0;
    if (location == RouteNames.myCourse) return 1;
    if (location == RouteNames.test) return 2;
    if (location == RouteNames.transactions) return 3;
    if (location == RouteNames.profile) return 4;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(RouteNames.home);
        break;
      case 1:
        context.go(RouteNames.myCourse);
        break;
      case 2:
        context.go(RouteNames.test);
        break;
      case 3:
        context.go(RouteNames.transactions);
        break;
      case 4:
        context.go(RouteNames.profile);
        break;
    }
  }
}
