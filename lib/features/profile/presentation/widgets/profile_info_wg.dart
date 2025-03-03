import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/utils/utils_export.dart';

class ProfileInfoWg extends StatelessWidget {
  final VoidCallback onEdit;
  final String? image;
  final String name;
  final String gmail;

  const ProfileInfoWg({
    super.key,
    required this.onEdit,
    required this.name,
    required this.gmail,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(190),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image ?? "no image"),
            radius: appH(60),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: onEdit,
                child: Icon(
                  IconlyBold.editSquare,
                  color: AppColors.primary(),
                  size: appH(30),
                ),
              ),
            ),
          ),
          Text(
            name,
            style: AppTextStyles.urbanist.bold(
              color: AppColors.black,
              fontSize: 24,
            ),
          ),
          Text(
            gmail,
            style: AppTextStyles.urbanist.semiBold(
              color: AppColors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
