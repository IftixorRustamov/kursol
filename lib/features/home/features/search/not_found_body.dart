import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  String? selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: appW(20), right: appW(14)),
        child: Column(
          children: [
            SizedBox(height: appH(60)),
            Image.asset('assets/images/error.png'),
            SizedBox(height: 20),
            Text(
              'Not Found',
              style: UrbanistTextStyles().bold(
                fontSize: 24,
                color: AppColors.greyScale.grey900,
              ),
            ),
            Text(
              'Sorry, the keyword you entered cannot be\n found, please check again or search with\n another keyword.',
              style: UrbanistTextStyles().regular(
                fontSize: 18,
                color: AppColors.greyScale.grey900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
