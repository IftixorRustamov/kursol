import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/secondary_button_wg.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/profile/widgets/profile_setting_row_wg.dart';
import 'package:kursol/features/profile/widgets/settings_switch_wg.dart';

class ProfileSecurityPage extends StatelessWidget {
  const ProfileSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.security,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
        child: Column(
          spacing: appH(36),
          children: [
            SettingsSwitchWg(
              text: AppStrings.rememberMe,
              switchValue: false,
              onChanged: (val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.faceId,
              switchValue: true,
              onChanged: (val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.biometricId,
              switchValue: true,
              onChanged: (val) {},
            ),
            ProfileSettingRowWg(
              title: AppStrings.googleAuthenticator,
              onPressed: () {},
            ),
            Column(
              spacing: appH(24),
              children: [
                SecondaryButtonWg(
                  title: AppStrings.changePin,
                  onPressed: () {},
                ),
                SecondaryButtonWg(
                  title: AppStrings.changePassword,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
