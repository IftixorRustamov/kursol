import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/enums/languages.dart';
import 'package:kursol/features/profile/presentation/pages/language/widgets/language_radio_wg.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/utils_export.dart';

class ProfileLanguagePage extends StatelessWidget {
  const ProfileLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.language,
        onBackPressed: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: appW(24),
          right: appW(24),
          top: appH(24),
          bottom: appH(48),
        ),
        child: Column(
          spacing: appH(24),
          children: [
            Column(
              spacing: appH(30),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text(AppStrings.suggested),
                LanguageRadioWg(
                  language: AppStrings.englishUS,
                  value: Languages.english,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
              ],
            ),
            Divider(color: AppColors.greyScale.grey200),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: appH(30),
              children: [
                _text(AppStrings.language),
                LanguageRadioWg(
                  language: AppStrings.russian,
                  value: Languages.russian,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
                LanguageRadioWg(
                  language: AppStrings.uzbek,
                  value: Languages.uzbek,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _text(String text) => Text(
      text,
      style: AppTextStyles.urbanist.bold(
        color: AppColors.greyScale.grey900,
        fontSize: 20,
      ),
    );
