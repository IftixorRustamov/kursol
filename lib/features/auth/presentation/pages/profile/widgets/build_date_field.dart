import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/utils/utils_export.dart';

Widget buildDateField(
    TextEditingController dateController, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      controller: dateController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyScale.grey50,
          hintText: "Date of Birth",
          hintStyle: AppTextStyles.urbanist.regular(
            color: AppColors.greyScale.grey500,
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          suffixIcon: IconButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  dateController.text =
                      DateFormat('MM/dd/yyyy').format(pickedDate);
                }
              },
              icon: Icon(IconlyLight.calendar)),
          suffixIconColor: AppColors.greyScale.grey500),
      style: AppTextStyles.urbanist.semiBold(
        color: AppColors.greyScale.grey900,
        fontSize: 14,
      ),
    ),
  );
}
