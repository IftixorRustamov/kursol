import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';

import '../widgets/detail_card_wg.dart';
import '../widgets/detail_item_wg.dart';

class EReceiptPage extends StatelessWidget {
  const EReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.eReceipt,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
          ),
        ],
      ),
      body: Padding(
        padding: scaffoldPadding,
        child: Column(
          spacing: appH(24),
          children: [
            Image.asset("assets/images/barcode_dummy.png"),
            DetailCard(
              items: const [
                DetailItem(label: "Course", value: "Mastering Figma A to Z"),
                DetailItem(label: "Category", value: "UI/UX Design"),
              ],
            ),
            DetailCard(
              items: const [
                DetailItem(label: "Name", value: "Andrew Ainsley"),
                DetailItem(label: "Phone", value: "+1 111 467 378 399"),
                DetailItem(label: "Email", value: "andrew_ainsley@domain.com"),
                DetailItem(label: "Country", value: "United States"),
              ],
            ),
            DetailCard(
              items: const [
                DetailItem(label: "Price", value: "\$40.00"),
                DetailItem(label: "Payment Methods", value: "Credit Card"),
                DetailItem(label: "Date", value: "Dec 14, 2024 | 14:27:45 PM"),
                DetailItem(
                  label: "Transaction ID",
                  value: "SK7263727399",
                  showCopyIcon: true,
                ),
                DetailItem(label: "Status", value: "Paid", isStatus: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
