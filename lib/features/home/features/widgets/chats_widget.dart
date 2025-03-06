import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class ChatsWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String jobTitle;

  const ChatsWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(imagePath), // загружаем изображение
            ),
            SizedBox(width: appW(20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: UrbanistTextStyles().bold(
                    fontSize: 18,
                    color: AppColors.greyScale.grey900,
                  ),
                ),
                Text(
                  jobTitle,
                  style: UrbanistTextStyles().medium(
                    fontSize: 14,
                    color: AppColors.greyScale.grey700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.chat,
                color: AppColors.primary.blue500,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
