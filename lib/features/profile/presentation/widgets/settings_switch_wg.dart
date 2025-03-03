import 'package:flutter/material.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/utils/utils_export.dart';

class SettingsSwitchWg extends StatelessWidget {
  final String text;
  final bool switchValue;
  final void Function(bool)? onChanged;

  const SettingsSwitchWg({
    super.key,
    required this.text,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.urbanist.semiBold(
            color: AppColors.greyScale.grey900,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: appH(24),
          width: appW(44),
          child: Switch.adaptive(
            activeColor: AppColors.white,
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                AppColors.blue;
              }
              return AppColors.white;
            }),
            activeTrackColor: AppColors.primary(),
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: AppColors.greyScale.grey200,
            value: switchValue,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
