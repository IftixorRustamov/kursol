import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/sizes/sizes.dart';

import '../../../core/common/constants/constants_export.dart';
import '../../../core/common/widgets/widgets_export.dart';
import '../../../core/utils/utils_export.dart';
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
        padding: scaffoldPadding48,
        child: SingleChildScrollView(
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
                  DetailItem(
                      label: "Email", value: "andrew_ainsley@domain.com"),
                  DetailItem(label: "Country", value: "United States"),
                ],
              ),
              DetailCard(
                items: const [
                  DetailItem(label: "Price", value: "\$40.00"),
                  DetailItem(label: "Payment Methods", value: "Credit Card"),
                  DetailItem(
                      label: "Date", value: "Dec 14, 2024 | 14:27:45 PM"),
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
      ),
    );
  }
}
