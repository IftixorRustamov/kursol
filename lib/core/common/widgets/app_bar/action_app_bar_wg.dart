import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';

import '../../../utils/textstyles/app_textstyles.dart';
import '../../constants/colors/app_colors.dart';

class ActionAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const ActionAppBarWg({
    super.key,
    required this.titleText,
    required this.onBackPressed,
    this.actions,
  });

  final String titleText;
  final VoidCallback onBackPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0.5,
      centerTitle: false,
      toolbarHeight: 64,
      title: Text(
        titleText,
        style: AppTextStyles.urbanist.bold(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(IconlyLight.arrow_left, size: appH(28)),
      ),
      actions: actions,
    );
  }
}
