import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/default_app_bar_wg.dart';
import 'package:kursol/core/routes/route_names.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/transaction/widgets/transactions_card_wg.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: DefaultAppBarWg(
        titleText: AppStrings.transactions,
        onMorePressed: () {},
        onSearchPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24)),
        child: Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: appH(44)),
            itemCount: 7, // dummy code
            itemBuilder:
                (context, index) => TransactionsCardWg(
                  onTap: () {},
                  onButtonPressed: () {
                    context.pushNamed(RouteNames.eReceipt);
                  },
                  title: "Flutter Mobile Apps",
                  courseImg: "assets/images/img.png",
                ),
          ),
        ),
      ),
    );
  }
}
