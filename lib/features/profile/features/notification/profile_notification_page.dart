import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/profile/widgets/settings_switch_wg.dart';

class ProfileNotificationPage extends StatefulWidget {
  const ProfileNotificationPage({super.key});

  @override
  State<ProfileNotificationPage> createState() =>
      _ProfileNotificationPageState();
}

class _ProfileNotificationPageState extends State<ProfileNotificationPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.notification,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
        child: Column(
          spacing: appH(40),
          children: [
            SettingsSwitchWg(
              text: AppStrings.generalNotification,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            SettingsSwitchWg(
              text: AppStrings.sound,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.vibrate,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.specialOffers,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.promoDiscount,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.payments,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.cashback,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.appUpdates,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.newServiceAvailable,
              switchValue: value,
              onChanged: (bool val) {},
            ),
            SettingsSwitchWg(
              text: AppStrings.newTipsAvailable,
              switchValue: value,
              onChanged: (bool val) {},
            ),
          ],
        ),
      ),
    );
  }
}
