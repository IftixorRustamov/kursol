import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/sizes/sizes.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/utils_export.dart';

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
        padding: scaffoldPadding48,
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) => BaseContactCardWg(
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
                    color: isInvited ? AppColors.primary() : AppColors.white,
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
