import 'package:flutter/material.dart';

import '../../../core/common/constants/colors/app_colors.dart';
import '../../../core/utils/responsiveness/app_responsive.dart';
import 'detail_item_wg.dart';

class DetailCard extends StatelessWidget {
  final List<DetailItem> items;

  const DetailCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      borderOnForeground: false,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: appH(12),
          children: items,
        ),
      ),
    );
  }
}
