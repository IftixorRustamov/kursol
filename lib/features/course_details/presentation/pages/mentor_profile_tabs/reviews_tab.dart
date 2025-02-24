import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/utils/textstyles/urbanist_textstyles.dart';

class ReviewsTab extends StatelessWidget {
  Map review;
  ReviewsTab({super.key,required this.review});

  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 4,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 4,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/images/mentor_avatar.png',
    },
    // Add more reviews as needed
  ];


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(review['avatar']),
                        radius: 20,
                      ),
                      SizedBox(width: 16),
                      Text(
                        review['name'],
                        style: urbanistTextStyles.bold(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: AppColors.blue, size: 16),
                        SizedBox(width: 4),
                        Text(
                          review['rating'].toString(),
                          style: urbanistTextStyles.bold(
                            color: AppColors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                review['comment'],
                style: urbanistTextStyles.bold(
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(IconlyBold.heart, color: Colors.red, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${review['likes']}',
                        style: urbanistTextStyles.bold(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    review['date'],
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

