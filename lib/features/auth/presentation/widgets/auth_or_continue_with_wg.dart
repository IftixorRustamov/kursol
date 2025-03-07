import 'package:flutter/material.dart';

import '../../../../config/gen/assets.gen.dart';
import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/utils/utils_export.dart';
import 'auth_sign_in_card.dart';

class AuthOrContinueWithWg extends StatelessWidget {
  final VoidCallback onTapFacebook;
  final VoidCallback onTapGoogle;
  final VoidCallback onTapApple;

  const AuthOrContinueWithWg(
      {super.key,
      required this.onTapFacebook,
      required this.onTapGoogle,
      required this.onTapApple});

  @override
  Widget build(BuildContext context) {
    final divider =
        Expanded(child: Divider(color: AppColors.greyScale.grey200));
    return Column(
      spacing: appH(20),
      children: [
        Row(
          spacing: 20,
          children: [
            divider,
            Text(
              AppStrings.orContinueWith,
              style: AppTextStyles.urbanist
                  .semiBold(color: AppColors.greyScale.grey700, fontSize: 18),
            ),
            divider,
          ],
        ),
        Row(
          spacing: appW(20),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthSignInCard(
                imgPath: Assets.images.facebook.image(
                  width: appH(24),
                  height: appH(24),
                ),
                onTap: onTapFacebook),
            AuthSignInCard(
                imgPath: Assets.images.google.image(
                  width: appH(24),
                  height: appH(24),
                ),
                onTap: onTapGoogle),
            AuthSignInCard(
                imgPath: Assets.images.apple.image(
                  width: appH(24),
                  height: appH(24),
                ),
                onTap: onTapApple),
          ],
        ),
      ],
    );
  }
}
