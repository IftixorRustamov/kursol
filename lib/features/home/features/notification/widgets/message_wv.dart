import 'package:flutter/material.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../../core/utils/textstyles/urbanist_textstyles.dart';

class MessageWv extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const MessageWv({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: appH(24)),
        padding: EdgeInsets.only(left: appW(10)),
        height: appH(112),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(imagePath), // Dynamic image path
            SizedBox(width: appW(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title, // Dynamic title
                  style: UrbanistTextStyles().bold(
                    fontSize: 18,
                    color: AppColors.greyScale.grey900,
                  ),
                ),
                Text(
                  subtitle, // Dynamic subtitle
                  style: UrbanistTextStyles().medium(
                    fontSize: 14,
                    color: AppColors.greyScale.grey700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
