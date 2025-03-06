import 'package:flutter/cupertino.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/utils/utils_export.dart';

class ProfilePaymentCardWg extends StatelessWidget {
  final String image;
  final String text;
  final String? status;

  const ProfilePaymentCardWg({
    super.key,
    required this.image,
    required this.text,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: appH(80),
      padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: appW(12),
            children: [
              Image.asset(image, height: appH(32), width: appW(32)),
              Text(
                text,
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Text(
            status ?? "",
            style: AppTextStyles.urbanist.bold(
              color: AppColors.primary(),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
