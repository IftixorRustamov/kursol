import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/default_button.dart';
import 'package:kursol/core/routes/route_names.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/profile/features/payment/widgets/profile_payment_card_wg.dart';

class ProfilePaymentPage extends StatelessWidget {
  const ProfilePaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.payment,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: appW(24),
          right: appW(24),
          top: appH(24),
          bottom: appH(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: appH(24),
              children: [
                ProfilePaymentCardWg(
                  image: "assets/images/paypal.png",
                  text: AppStrings.payPal,
                  status: AppStrings.connected,
                ),
                ProfilePaymentCardWg(
                  image: "assets/images/google.png",
                  text: AppStrings.googlePay,
                  status: AppStrings.connected,
                ),
                ProfilePaymentCardWg(
                  image: "assets/images/apple.png",
                  text: AppStrings.applePay,
                  status: AppStrings.connected,
                ),
                ProfilePaymentCardWg(
                  image: "assets/images/mastercard.png",
                  text: AppStrings.mastercardPay,
                  status: AppStrings.connected,
                ),
              ],
            ),
            DefaultButtonWg(
              title: AppStrings.addNewCard,
              onPressed: () {
                context.pushNamed(RouteNames.paymentAddNewCard);
              },
            ),
          ],
        ),
      ),
    );
  }
}
