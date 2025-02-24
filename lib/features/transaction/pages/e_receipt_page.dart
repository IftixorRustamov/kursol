import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/strings/strings.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';

class EReceiptPage extends StatelessWidget {
  const EReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.go(RoutePaths.eReceipt);
        },
        titleText: AppStrings.eReceipt,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
          ),
        ],
      ),
      body: Column(children: []),
    );
  }
}
