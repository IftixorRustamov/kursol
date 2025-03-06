import 'package:flutter/material.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/utils/utils_export.dart';

class AuthSignInUpChoiceWg extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const AuthSignInUpChoiceWg(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.urbanist
              .regular(color: AppColors.greyScale.grey500, fontSize: 14),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.urbanist
                .semiBold(color: AppColors.primary(), fontSize: 14),
          ),
        ),
      ],
    );
  }
}
