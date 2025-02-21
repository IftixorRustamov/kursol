import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class RatingButton extends StatelessWidget {
  final String category;
  final String label;
  final ValueChanged<String> onSelected;
  final String selectedCategory;

  const RatingButton({
    Key? key,
    required this.category,
    required this.label,
    required this.onSelected,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedCategory == category;

    return InkWell(
      onTap: () {
        if (!isSelected) {
          onSelected(category);
        }
      },
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppColors.primary.blue500 : AppColors.white,
          border: Border.all(color: AppColors.primary.blue500, width: appW(2)),
        ),
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(8)),
        margin: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: isSelected ? AppColors.white : AppColors.primary.blue500,
              size: appW(18),
            ),
            SizedBox(width: appW(8)),
            Text(
              label,
              style: UrbanistTextStyles().semiBold(
                fontSize: 16,
                color: isSelected ? AppColors.white : AppColors.primary.blue500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
