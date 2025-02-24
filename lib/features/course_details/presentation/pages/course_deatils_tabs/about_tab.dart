import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/routes/route_paths.dart';
import '../../../../../core/utils/textstyles/urbanist_textstyles.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    super.key,
    required this.urbanistTextStyles,
    required this.isDarkMode,
  });

  final UrbanistTextStyles urbanistTextStyles;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentor',
            style: urbanistTextStyles.bold(
                fontSize:26,
                color:isDarkMode ? AppColors.white : AppColors.black
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push(RoutePaths.mentorProfile);
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Image(
                  image: AssetImage(
                    'assets/images/mentor_avatar.png',
                  ),
                ),
              ),
              title: Text(
                'Jonathan Williams',
                style: urbanistTextStyles.bold(
                    fontSize:22,
                    color:isDarkMode ? AppColors.white : AppColors.black
                ),
              ),
              subtitle: Text(
                'Senior UI/UX Designer at Google',
                style: urbanistTextStyles.bold(
                    fontSize:16,
                    color:AppColors.greyScale.grey500
                ),
              ),
              trailing: Icon(
                IconlyLight.chat,
                size: 23,
                color: AppColors.blue,
              ),
            ),
          ),
          Text(
            'About Course',
            style: urbanistTextStyles.bold(
                fontSize:26,
                color:isDarkMode ? AppColors.white : AppColors.black
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip. ",
            style: urbanistTextStyles.bold(
                fontSize:16,
                color:AppColors.greyScale.grey500
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tools',
            style: urbanistTextStyles.bold(
                fontSize:26,
                color:isDarkMode ? AppColors.white : AppColors.black
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset('assets/images/figma_logo.png'),
              const SizedBox(width: 5),
              Text(
                "Figma",
                style: urbanistTextStyles.bold(
                    fontSize:20,
                    color:isDarkMode ? AppColors.white : AppColors.black
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
