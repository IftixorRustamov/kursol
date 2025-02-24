
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/utils/textstyles/urbanist_textstyles.dart';

class ReviewsTab extends StatefulWidget {
  @override
  _ReviewsTabState createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  int _selectedFilter = 0;
  UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();

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

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating Summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(IconlyBold.star, color: Colors.amber),
                  const SizedBox(width: 10),
                  Text(
                    '4.8 (4,479 reviews)',
                    style: urbanistTextStyles.bold(
                      fontSize: 20,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Text(
                  'See All',
                  style: urbanistTextStyles.bold(
                    fontSize: 20,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Rating Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton('All', 0),
                _buildFilterButton('5', 1),
                _buildFilterButton('4', 2),
                _buildFilterButton('3', 3),
                _buildFilterButton('2', 4),
                _buildFilterButton('1', 5),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Reviews List
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return _buildReviewCard(reviews[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, int index) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedFilter = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedFilter == index ? AppColors.blue : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side:
            _selectedFilter == index
                ? BorderSide.none
                : BorderSide(color: AppColors.blue, width: 2.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text != 'All')
              Icon(
                Icons.star,
                color:
                _selectedFilter == index ? AppColors.white : AppColors.blue,
                size: 16,
              ),
            SizedBox(width: text != 'All' ? 4 : 0),
            Text(
              text,
              style: urbanistTextStyles.bold(
                color:
                _selectedFilter == index ? AppColors.white : AppColors.blue,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
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
                  setState(() {});
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
          Text(review['comment'], style: urbanistTextStyles.bold(
              color: isDarkMode ? AppColors.white : AppColors.black,
              fontSize: 14),),
          SizedBox(height: 12),
          Row(
            children: [
              Row(
                children: [
                  Icon(IconlyBold.heart, color: Colors.red, size: 20),
                  SizedBox(width: 4),
                  Text('${review['likes']}', style: urbanistTextStyles.bold(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    fontSize: 12,)),
                ],
              ),
              const SizedBox(width: 10,),
              Text(
                review['date'],
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.amber : Colors.grey,
          size: 16,
        );
      }),
    );
  }
}