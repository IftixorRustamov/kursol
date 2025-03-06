import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:go_router/go_router.dart';

import '../../../core/common/constants/constants_export.dart';
import '../../../core/common/widgets/widgets_export.dart';
import '../../../core/utils/utils_export.dart';

class TestDetailPage extends StatelessWidget {
  final String testTitle;

  const TestDetailPage({super.key, required this.testTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () => Navigator.pop(context),
        titleText: testTitle,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("Majburiy fanlar", "15 mins", isDarkMode),
              _buildLessonItem(
                  context, "01", "Matematika", "10 mins", isDarkMode),
              _buildLessonItem(
                  context, "02", "Adabiyot & Ona tili", "5 mins", isDarkMode),
              SizedBox(height: appH(20)),
              _buildSectionHeader("Asosiy fanlar", "60 mins", isDarkMode),
              _buildLessonItem(
                  context, "03", "Matematika", "15 mins", isDarkMode),
              _buildLessonItem(context, "04", "Fizika", "15 mins", isDarkMode),
              _buildLessonItem(
                  context, "05", "Informatika", "15 mins", isDarkMode),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        isDarkMode: isDarkMode,
        buttonText: AppStrings.startTest,
        onPressed: () {
          _onStartTest(context, testTitle);
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, String duration, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appH(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.urbanist.semiBold(
              color: isDarkMode ? Colors.white : AppColors.black,
              fontSize: appH(18),
            ),
          ),
          Text(
            duration,
            style: AppTextStyles.urbanist.semiBold(
              color: AppColors.primary.blue500,
              fontSize: appH(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem(BuildContext context, String number, String title,
      String duration, bool isDarkMode) {
    return GestureDetector(
      onTap: () {
        _onStartTest(context, title);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: appH(12)),
        padding: EdgeInsets.symmetric(vertical: appH(16), horizontal: appW(16)),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark2 : Colors.white,
          borderRadius: BorderRadius.circular(appH(18)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.blue500.withOpacity(0.2),
              radius: appH(24),
              child: Text(
                number,
                style: AppTextStyles.urbanist
                    .bold(color: AppColors.primary.blue500, fontSize: appH(18)),
              ),
            ),
            SizedBox(width: appW(16)),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.urbanist.semiBold(
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontSize: appH(18)),
              ),
            ),
            IconButton(
              icon: Icon(IconlyBold.play,
                  size: appH(28), color: AppColors.primary.blue500),
              onPressed: () {
                _onStartTest(context, title);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onStartTest(BuildContext context, String subject) {
    context.push('/test-solving', extra: {'subject': subject});
  }
}
