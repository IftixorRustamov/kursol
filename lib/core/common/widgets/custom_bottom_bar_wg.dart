import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onPressed;
  final String buttonText;

  const CustomBottomBar({
    super.key,
    required this.isDarkMode,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: isDarkMode ? AppColors.background.dark : AppColors.white,
          border: Border(
            left: BorderSide(
              color: isDarkMode ? AppColors.greyScale.grey700 : AppColors.greyScale.grey300,
              width: 0.4,
            ),
            right: BorderSide(
              color: isDarkMode ? AppColors.greyScale.grey700 : AppColors.greyScale.grey300,
              width: 0.4,
            ),
            top: BorderSide(
              color: isDarkMode ? AppColors.greyScale.grey700 : AppColors.greyScale.grey300,
              width: 0.4,
            ),
          ),
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: Offset(0, -3),
              ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary.blue500,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
