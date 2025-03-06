import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../../core/utils/textstyles/app_textstyles.dart';

Widget buildPasswordField({
  required String hintText,
  required bool obscureText,
  required VoidCallback toggleVisibility,
}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.greyScale.grey50,
      hintText: hintText,
      hintStyle: AppTextStyles.urbanist.regular(
        color: AppColors.black,
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      prefixIcon: Icon(IconlyBold.lock, color: AppColors.black),
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.black,
        ),
        onPressed: toggleVisibility,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),
    style: AppTextStyles.urbanist.semiBold(
      color: AppColors.greyScale.grey900,
      fontSize: 14,
    ),
  );
}
