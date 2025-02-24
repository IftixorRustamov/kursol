import 'package:flutter/material.dart';

import '../../../core/common/constants/colors/app_colors.dart';
import '../../../core/utils/responsiveness/app_responsive.dart';

class ProfileBlankContainerWg extends StatelessWidget {
  final Widget widget;

  const ProfileBlankContainerWg({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      width: double.infinity,
      height: appH(56),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greyScale.grey50,
      ),
      child: widget,
    );
  }
}
