import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/home/features/notification/widgets/message_wv.dart';

import '../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () => Navigator.pop(context),
        titleText: "Notification",
        actions: [
          IconButton(
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(14.0)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: appH(10)),
              Text(
                'Today',
                style: UrbanistTextStyles().bold(
                  fontSize: 18,
                  color: AppColors.greyScale.grey900,
                ),
              ),
              MessageWv(
                title: 'Payment Successful!',
                subtitle: 'You have made a course payment',
                imagePath: 'assets/images/Group.png',
              ),
              MessageWv(
                title: 'Today’s Special Offers',
                subtitle: 'Now the 3D design course is available',
                imagePath: 'assets/images/group1.png',
              ),
              SizedBox(height: appH(20)),
              Text(
                'Yesterday',
                style: UrbanistTextStyles().bold(
                  fontSize: 18,
                  color: AppColors.greyScale.grey900,
                ),
              ),
              MessageWv(
                title: 'Today’s Special Offers',
                subtitle: 'You get a special promo today!',
                imagePath: 'assets/images/group2.png',
              ),
              MessageWv(
                title: 'Credit Card Connected!',
                subtitle: 'Credit Card has been linked!',
                imagePath: 'assets/images/Group.png',
              ),
              SizedBox(height: appH(20)),
              Text(
                'December 22, 2024',
                style: UrbanistTextStyles().bold(
                  fontSize: 18,
                  color: AppColors.greyScale.grey900,
                ),
              ),
              MessageWv(
                title: 'Account Setup Successful!',
                subtitle: 'Your account has been created!',
                imagePath: 'assets/images/group3.png',
              ),
              MessageWv(
                title: 'Today’s Special Offers',
                subtitle: 'You get a special promo today!',
                imagePath: 'assets/images/Group.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
