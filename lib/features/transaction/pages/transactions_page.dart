import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/routes/route_names.dart';
import 'package:kursol/features/transaction/widgets/transactions_card_wg.dart';

import '../../../core/common/constants/constants_export.dart';
import '../../../core/common/widgets/widgets_export.dart';
import '../../../core/utils/utils_export.dart';

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
            itemBuilder: (context, index) => TransactionsCardWg(
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
