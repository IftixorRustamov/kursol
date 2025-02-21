import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

class SearchHistoryBody extends StatelessWidget {
  const SearchHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: appW(20), right: appH(14)),
      child: Column(
        children: [
          SizedBox(height: appH(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent",
                style: UrbanistTextStyles().bold(
                  fontSize: 20,
                  color: AppColors.greyScale.grey900,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Clear All",
                  style: UrbanistTextStyles().bold(
                    color: AppColors.primary.blue500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: appH(10)),
          Divider(thickness: 1, color: AppColors.greyScale.grey200),
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              itemBuilder: (context, index) => _searchedHistory(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchedHistory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "CRM Management",
          style: UrbanistTextStyles().medium(
            fontSize: 18,
            color: AppColors.greyScale.grey600,
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(IconlyLight.close_square)),
      ],
    );
  }
}
