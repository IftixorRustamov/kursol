import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/default_app_bar_wg.dart';
import 'package:kursol/core/routes/route_names.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:kursol/features/profile/widgets/logout_bottom_sheet_wg.dart';
import 'package:kursol/features/profile/widgets/profile_info_wg.dart';
import 'package:kursol/features/profile/widgets/profile_setting_row_wg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: DefaultAppBarWg(
        titleText: AppStrings.profile,
        onMorePressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(12)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: appH(20),
            children: [
              ProfileInfoWg(
                onEdit:
                    () =>
                        context.go(RoutePaths.profile + RoutePaths.editProfile),
                name: "Iftixor Rustamov",
                gmail: "iftixorrustamovv@gmail.com",
                image: "assets/images/profile.png",
              ),
              Divider(height: 1, color: AppColors.greyScale.grey200),
              // * Edit Profile
              ProfileSettingRowWg(
                icon: IconlyLight.profile,
                title: AppStrings.editProfile,
                onPressed:
                    () =>
                        context.go(RoutePaths.profile + RoutePaths.editProfile),
              ),
              // * Notification
              ProfileSettingRowWg(
                icon: IconlyLight.notification,
                title: AppStrings.notification,
                onPressed: () {
                  context.go(RoutePaths.profile + RoutePaths.notification);
                },
              ),
              // * Payment
              ProfileSettingRowWg(
                icon: IconlyLight.wallet,
                title: AppStrings.payment,
                onPressed: () {
                  context.pushNamed(RouteNames.profilePayment);
                },
              ),
              // * Security
              ProfileSettingRowWg(
                icon: IconlyLight.shield_done,
                title: AppStrings.security,
                onPressed: () {
                  context.pushNamed(RouteNames.profileSecurity);
                },
              ),
              // * Language
              ProfileSettingRowWg(
                icon: Icons.language, //
                title: AppStrings.language,
                secondaryText: "English (US)",
                onPressed: () {
                  context.pushNamed(RouteNames.profileLanguage);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: appW(20),
                    children: [
                      Icon(
                        IconlyLight.show,
                        size: appH(28),
                        color: AppColors.greyScale.grey900,
                      ),
                      Text(
                        AppStrings.darkMode,
                        style: AppTextStyles.urbanist.semiBold(
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Switch.adaptive(value: false, onChanged: (val) {}),
                ],
              ),
              // * Privacy Policy
              ProfileSettingRowWg(
                icon: IconlyLight.lock,
                title: AppStrings.privacyPolicy,
                onPressed: () {
                  context.pushNamed(RouteNames.profilePrivacy);
                },
              ),
              // * Help Center
              ProfileSettingRowWg(
                icon: IconlyLight.info_square,
                title: AppStrings.helpCenter,
                onPressed: () {
                  context.pushNamed(RouteNames.profileHelpCenter);
                },
              ),
              // * Invite Friends
              ProfileSettingRowWg(
                icon: IconlyLight.user_1,
                title: AppStrings.inviteFriends,
                onPressed: () {
                  context.pushNamed(RouteNames.profileInviteFriends);
                },
              ),
              InkWell(
                onTap: () => showLogoutModal(context),
                child: Row(
                  spacing: appW(20),
                  children: [
                    Icon(
                      IconlyLight.logout,
                      size: appH(28),
                      color: AppColors.red,
                    ),
                    Text(
                      AppStrings.logOut,
                      style: AppTextStyles.urbanist.semiBold(
                        color: AppColors.red,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
