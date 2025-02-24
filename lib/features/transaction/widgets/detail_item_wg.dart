import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';

class DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final bool showCopyIcon;
  final bool isStatus;

  const DetailItem({
    super.key,
    required this.label,
    required this.value,
    this.showCopyIcon = false,
    this.isStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.urbanist.medium(
            color: AppColors.greyScale.grey700,
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            if (isStatus)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: appW(10),
                  vertical: appH(6),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.blue100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  value,
                  style: AppTextStyles.urbanist.semiBold(
                    color: AppColors.primary(),
                    fontSize: 10,
                  ),
                ),
              )
            else
              Text(
                value,
                style: AppTextStyles.urbanist.semiBold(
                  color: AppColors.greyScale.grey800,
                  fontSize: 16,
                ),
              ),
            if (showCopyIcon) ...[
              SizedBox(width: appW(6)),
              Icon(Icons.copy, size: appH(20), color: AppColors.primary()),
            ],
          ],
        ),
      ],
    );
  }
}
