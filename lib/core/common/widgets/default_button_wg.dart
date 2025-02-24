import 'package:flutter/material.dart';

import '../../utils/responsiveness/app_responsive.dart';
import '../../utils/textstyles/app_textstyles.dart';
import '../constants/colors/app_colors.dart';

class DefaultButtonWg extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const DefaultButtonWg({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(58),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: AppColors.primary()),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTextStyles.urbanist.bold(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
