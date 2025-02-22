import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: screenWidth * 0.95,
        padding: EdgeInsets.all(screenWidth * 0.06),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark3 : AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDarkMode ? Colors.transparent : AppColors.greyScale.grey700,
            width: isDarkMode ? 0 : 2,
          ),
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                color: Colors.black12,
                blurRadius: 14,
                spreadRadius: 4,
              ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: screenHeight * 0.1),
            SizedBox(height: screenHeight * 0.018),
            Text(
              'Certificate of Completion',
              style: AppTextStyles.urbanist.bold(
                fontSize: screenWidth * 0.055,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            Text(
              'Presented to',
              style: AppTextStyles.urbanist.regular(
                fontSize: screenWidth * 0.04,
                color: isDarkMode ? AppColors.greyScale.grey300 : AppColors.greyScale.grey700,
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              'Andrew Ainsley',
              style: AppTextStyles.urbanist.bold(
                fontSize: screenWidth * 0.06,
                color: AppColors.primary.blue500,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'For the successful completion of',
              style: AppTextStyles.urbanist.regular(
                fontSize: screenWidth * 0.04,
                color: isDarkMode ? AppColors.greyScale.grey300 : AppColors.greyScale.grey700,
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              '3D Design Illustration Course',
              style: AppTextStyles.urbanist.semiBold(
                fontSize: screenWidth * 0.05,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'Issued on December 20, 2024',
              style: AppTextStyles.urbanist.regular(
                fontSize: screenWidth * 0.035,
                color: isDarkMode ? AppColors.greyScale.grey300 : AppColors.greyScale.grey700,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              'ID: SK123456789',
              style: AppTextStyles.urbanist.regular(
                fontSize: screenWidth * 0.035,
                color: isDarkMode ? AppColors.greyScale.grey300 : AppColors.greyScale.grey700,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Image.asset('assets/images/signature.png', height: screenHeight * 0.08),
            SizedBox(height: screenHeight * 0.008),
            Text(
              'James Anderson Lawren',
              style: AppTextStyles.urbanist.bold(
                fontSize: screenWidth * 0.045,
                color: AppColors.primary.blue500,
              ),
            ),
            Text(
              'Elera Courses Manager',
              style: AppTextStyles.urbanist.regular(
                fontSize: screenWidth * 0.035,
                color: isDarkMode ? AppColors.greyScale.grey300 : AppColors.greyScale.grey700,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
