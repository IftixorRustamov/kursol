import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import '../../../utils/textstyles/app_textstyles.dart';
import '../../constants/colors/app_colors.dart';

class ActionAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const ActionAppBarWg({
    super.key,
    this.titleText,
    required this.onBackPressed,
    this.actions,
  });

  final String? titleText;
  final VoidCallback onBackPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
      elevation: 0,
      centerTitle: false,
      title: Text(
        titleText ?? "",
        style: AppTextStyles.urbanist.bold(
          color: isDarkMode ? Colors.white : AppColors.black,
          fontSize: 24,
        ),
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(
          IconlyLight.arrow_left,
          size: appH(28),
          color: isDarkMode ? Colors.white : AppColors.black,
        ),
      ),
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark : AppColors.white,
          border: Border(
            bottom: BorderSide(
              color: isDarkMode ? AppColors.greyScale.grey800 : AppColors.greyScale.grey300,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
