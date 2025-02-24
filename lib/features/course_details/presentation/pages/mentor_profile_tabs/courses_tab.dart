import 'package:flutter/material.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/utils/textstyles/urbanist_textstyles.dart';

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    List courses = [
      {
        'title': 'Learn UX User Persona',
        'image': 'assets/images/course.png',
        'rating': 4.7,
        'students': '7,388',
        'price': '\$42',
      },
      {
        'title': '3D Design Illustration',
        'image': 'assets/images/course.png',
        'rating': 4.1,
        'students': '945',
        'price': '\$41',
      },
      {
        'title': 'Learn UX User Persona',
        'image': 'assets/images/course.png',
        'rating': 4.7,
        'students': '7,388',
        'price': '\$42',
      },
      {
        'title': '3D Design Illustration',
        'image': 'assets/images/course.png',
        'rating': 4.1,
        'students': '945',
        'price': '\$41',
      },
      {
        'title': 'Learn UX User Persona',
        'image': 'assets/images/course.png',
        'rating': 4.7,
        'students': '7,388',
        'price': '\$42',
      },
      {
        'title': '3D Design Illustration',
        'image': 'assets/images/course.png',
        'rating': 4.1,
        'students': '945',
        'price': '\$41',
      },
    ];
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> course = courses[index];
        return Card(
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    course['image'],
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: urbanistTextStyles.bold(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '${course['rating']}',
                            style: TextStyle(color: AppColors.greyScale.grey900),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${course['students']} students',
                            style: TextStyle(color: AppColors.greyScale.grey600),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        course['price'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );  }
}


