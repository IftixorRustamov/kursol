import 'package:flutter/material.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/utils/utils_export.dart';

class AuthCheckboxWg extends StatelessWidget {
  final bool rememberMe;
  final void Function(bool?)? onChanged;

  const AuthCheckboxWg(
      {super.key, required this.rememberMe, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(color: AppColors.primary(), width: 2),
          checkColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          activeColor: AppColors.primary(),
          value: rememberMe,
          onChanged: onChanged,
        ),
        Text(AppStrings.rememberMe,
            style: AppTextStyles.urbanist
                .semiBold(color: AppColors.greyScale.grey900, fontSize: 14)),
      ],
    );
  }
}
