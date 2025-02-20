import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/default_app_bar_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
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
                onEdit: () => context.push(RoutePaths.editProfile ),
                name: "Iftixor Rustamov",
                gmail: "iftixorrustamovv@gmail.com",
                image: "assets/images/profile.png",
              ),
              Divider(height: 1, color: AppColors.greyScale.grey200),
              ProfileSettingRowWg(
                icon: IconlyLight.profile,
                title: AppStrings.editProfile,
                onPressed: () => context.push(RoutePaths.editProfile),
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.notification,
                title: AppStrings.notification,
                onPressed: () {},
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.wallet,
                title: AppStrings.payment,
                onPressed: () {},
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.shield_done,
                title: AppStrings.security,
                onPressed: () {},
              ),
              ProfileSettingRowWg(
                icon: Icons.language, //
                title: AppStrings.language,
                secondaryText: "English (US)",
                onPressed: () {},
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.toggle_off)),
                ],
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.lock,
                title: AppStrings.privacyPolicy,
                onPressed: () {},
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.info_square,
                title: AppStrings.helpCenter,
                onPressed: () {},
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.user_1,
                title: AppStrings.inviteFriends,
                onPressed: () {},
              ),
              ProfileSettingRowWg(
                icon: IconlyLight.user_1,
                title: AppStrings.inviteFriends,
                onPressed: () {},
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
