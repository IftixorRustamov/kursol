import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/features/profile/presentation/pages/help_center/widgets/contact_us_tab.dart';
import 'package:kursol/features/profile/presentation/pages/help_center/widgets/faq_tab.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/utils_export.dart';

class ProfileHelpCenterPage extends StatefulWidget {
  const ProfileHelpCenterPage({super.key});

  @override
  State<ProfileHelpCenterPage> createState() => _ProfileHelpCenterPageState();
}

class _ProfileHelpCenterPageState extends State<ProfileHelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.helpCenter,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24)),
        child: Column(
          spacing: appH(24),
          children: [
            CustomTabBar(
              tabController: _tabController,
              tabTitles: [AppStrings.faq, AppStrings.contactUs],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [FaqTab(), ContactUsTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
