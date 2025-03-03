import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/utils_export.dart';

class ProfilePrivacyPage extends StatelessWidget {
  const ProfilePrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.privacyPolicy,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: appW(24),
          left: appW(24),
          top: appH(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.typesOfData,
              style: AppTextStyles.urbanist.bold(
                color: AppColors.greyScale.grey900,
                fontSize: 20,
              ),
            ),
            Text(
              "SS asldfj asdlifj asdlfhqehraf qwe fqhiuerh qbwiepurh iuqwehr asd asdf woeijf 3oijfg dfljs ognfslfjg ",
              style: AppTextStyles.urbanist.regular(
                color: AppColors.greyScale.grey900,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
