import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/utils_export.dart';
import '../../widgets/profile_setting_row_wg.dart';
import '../../widgets/settings_switch_wg.dart';

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
