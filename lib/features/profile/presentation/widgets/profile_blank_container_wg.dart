import 'package:flutter/material.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/utils/utils_export.dart';

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
