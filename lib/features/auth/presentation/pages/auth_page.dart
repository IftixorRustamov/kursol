import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/config/gen/assets.gen.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/default_button_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../widgets/auth_sign_in_button_wg.dart';
import '../widgets/auth_sign_in_up_choice_wg.dart';

final _divider = Expanded(child: Divider(color: AppColors.greyScale.grey200));

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBarWg(onBackPressed: () {}),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: scaffoldPadding48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.images.auth.image(),
            Text(AppStrings.letsYouIn,
                textAlign: TextAlign.center,
                style: AppTextStyles.urbanist
                    .bold(color: AppColors.greyScale.grey900, fontSize: 48)),
            // * Buttons
            Column(
              spacing: appH(24),
              children: [
                AuthSignInButtonWg(
                  image: Assets.images.facebook
                      .image(height: appH(24), width: appW(24)),
                  text: AppStrings.continueWithFacebook,
                  onTap: () {},
                ),
                AuthSignInButtonWg(
                  image: Assets.images.google
                      .image(height: appH(24), width: appW(24)),
                  text: AppStrings.continueWithGoogle,
                  onTap: () {},
                ),
                AuthSignInButtonWg(
                  image: Assets.images.apple
                      .image(height: appH(24), width: appW(24)),
                  text: AppStrings.continueWithApple,
                  onTap: () {},
                ),
                Row(
                  spacing: appW(16),
                  children: [
                    _divider,
                    Text(
                      AppStrings.or,
                      style: AppTextStyles.urbanist.semiBold(
                          color: AppColors.greyScale.grey700, fontSize: 18),
                    ),
                    _divider,
                  ],
                ),
                DefaultButtonWg(
                    title: AppStrings.signInWithPassword,
                    onPressed: () {
                      context.go(RoutePaths.signin);
                    }),
              ],
            ),
            AuthSignInUpChoiceWg(
                text: AppStrings.dontHaveAccount,
                onPressed: () {
                  context.go(RoutePaths.signup);
                },
                buttonText: AppStrings.signUp)
          ],
        ),
      ),
    );
  }
}
