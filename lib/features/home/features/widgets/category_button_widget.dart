import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class CategoryButton extends StatefulWidget {
  final String category;
  final String label;
  final ValueChanged<String> onSelected;
  final String selectedCategory;

  const CategoryButton({
    Key? key,
    required this.category,
    required this.label,
    required this.onSelected,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedCategory == widget.category;

    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppColors.primary.blue500 : AppColors.white,
          border: Border.all(color: AppColors.primary.blue500, width: appW(2)),
        ),
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(8)),
        margin: const EdgeInsets.only(right: 20),
        child: Text(
          widget.label,
          style: UrbanistTextStyles().semiBold(
            fontSize: 16,
            color: isSelected ? AppColors.white : AppColors.primary.blue500,
          ),
        ),
      ),
    );
  }
}
