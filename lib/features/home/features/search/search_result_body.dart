import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/home/features/search/courses_body.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';
import 'not_found_body.dart';

class SearchResultBody extends StatefulWidget {
  final String query;

  const SearchResultBody({super.key, required this.query});

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  String selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      child: Column(
        children: [
          SizedBox(height: appH(25)),
          Row(
            children: [
              Expanded(child: _buildCustomButton('Courses')),
              SizedBox(width: appW(10)),
              Expanded(child: _buildCustomButton('Mentors')),
            ],
          ),
          SizedBox(height: appH(24)),
          Row(
            children: [
              Text(
                'Results for ',
                style: UrbanistTextStyles().bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 20,
                ),
              ),
              Text(
                '“${widget.query}”',
                style: UrbanistTextStyles().bold(
                  color: AppColors.primary.blue500,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                '0 found',
                style: UrbanistTextStyles().bold(
                  color: AppColors.primary.blue500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: appH(20)),
          Expanded(
            child:
                selectedButton == 'Courses'
                    ? CoursesBody()
                    // : MentorsBody(),
                    : NotFoundPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(String title) {
    bool isSelected = selectedButton == title;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = title;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.primary.blue500 : AppColors.white,
        side: BorderSide(color: AppColors.primary.blue500, width: appW(2)),
        padding: EdgeInsets.symmetric(horizontal: appW(55), vertical: appH(14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(
        title,
        style: UrbanistTextStyles().bold(
          color: isSelected ? AppColors.white : AppColors.primary.blue500,
          fontSize: 18,
        ),
      ),
    );
  }
}
