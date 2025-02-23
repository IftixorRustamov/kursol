import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/config/gen/assets.gen.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import '../../../utils/textstyles/app_textstyles.dart';
import '../../constants/colors/app_colors.dart';

class DefaultAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBarWg({
    super.key,
    required this.titleText,
    this.onSearchPressed,
    required this.onMorePressed,
  });

  final String titleText;
  final VoidCallback? onSearchPressed;
  final VoidCallback onMorePressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      elevation: 0.5,
      centerTitle: false,
      leading: Assets.images.logo.image(width: appW(32), height: appH(32)),
      title: Text(
        titleText,
        style: AppTextStyles.urbanist.bold(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      actions: [
        if (onSearchPressed != null)
          IconButton(
            onPressed: onSearchPressed,
            icon: Icon(
              IconlyLight.search,
              size: appH(28),
              color: AppColors.black,
            ),
          ),
        IconButton(
          onPressed: onMorePressed,
          icon: Icon(
            IconlyLight.more_circle,
            size: appH(28),
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
