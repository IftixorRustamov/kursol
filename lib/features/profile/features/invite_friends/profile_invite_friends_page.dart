import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/cards/base_contact_card_wg.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../core/utils/textstyles/app_textstyles.dart';

class ProfileInviteFriendsPage extends StatefulWidget {
  const ProfileInviteFriendsPage({super.key});

  @override
  State<ProfileInviteFriendsPage> createState() =>
      _ProfileInviteFriendsPageState();
}

class _ProfileInviteFriendsPageState extends State<ProfileInviteFriendsPage> {
  bool isInvited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.inviteFriends,
      ),
      body: Padding(
        padding: scaffoldPadding,
        child: ListView.builder(
          itemCount: 12,
          itemBuilder:
              (context, index) => BaseContactCardWg(
                imagePath: "assets/images/boy.png",
                name: "Rustamov Iftikhor",
                subtitle: "+998 90 180 20 40",
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      isInvited = !isInvited;
                    });
                  },
                  child: Chip(
                    backgroundColor:
                        isInvited ? AppColors.white : AppColors.primary(),
                    shape: StadiumBorder(
                      side: BorderSide(color: AppColors.primary(), width: 2),
                    ),
                    label: Text(
                      isInvited ? AppStrings.invited : AppStrings.invite,
                      style: AppTextStyles.urbanist.semiBold(
                        color:
                            isInvited ? AppColors.primary() : AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(12),
                      vertical: appH(6),
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
