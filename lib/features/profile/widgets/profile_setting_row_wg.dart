import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../core/common/constants/colors/app_colors.dart';
import '../../../core/utils/responsiveness/app_responsive.dart';
import '../../../core/utils/textstyles/app_textstyles.dart';

class ProfileSettingRowWg extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? secondaryText;
  final VoidCallback onPressed;

  const ProfileSettingRowWg({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: appW(20),
          children: [
            Icon(icon, size: appH(28), color: AppColors.greyScale.grey900),
            Text(
              title,
              style: AppTextStyles.urbanist.semiBold(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          spacing: appW(20),
          children: [
            Text(
              secondaryText ?? "",
              style: AppTextStyles.urbanist.semiBold(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(IconlyLight.arrow_right_2),
            ),
          ],
        ),
      ],
    );
  }
}
