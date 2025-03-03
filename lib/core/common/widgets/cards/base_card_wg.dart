import 'package:flutter/material.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../utils/responsiveness/app_responsive.dart';

class BaseCardWg extends StatelessWidget {
  final VoidCallback onTap;
  final String courseImg;
  final List<Widget> mainWidgets;
  final Widget? trailingWidget;

  const BaseCardWg({
    super.key,
    required this.onTap,
    required this.courseImg,
    required this.mainWidgets,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: appH(140),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyScale.grey300,
            blurRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(appH(20)),
      margin: EdgeInsets.only(bottom: appH(20)),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          spacing: appW(16),
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                courseImg, // Replaced !!!
                width: appW(100),
                height: appH(100),
                fit: BoxFit.cover,
              ),
            ),
            // title, subtitle or any widget
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: mainWidgets,
              ),
            ),
            // trailing widget
            trailingWidget ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
