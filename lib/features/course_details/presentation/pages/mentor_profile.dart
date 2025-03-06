import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';

import '../../../../core/common/constants/colors/app_colors.dart';

class MentorProfilePage extends StatefulWidget {
  const MentorProfilePage({super.key});

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.black : AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            color: isDarkMode ? AppColors.white : AppColors.black,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyLight.more_circle,
              color: isDarkMode ? AppColors.white : AppColors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          Container(
            padding: EdgeInsets.all(16.0),
            color: isDarkMode ? AppColors.black : AppColors.white,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/100',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jonathan Williams',
                  style: urbanistTextStyles.bold(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Senior UI/UX Designer at Google',
                  style: urbanistTextStyles.bold(
                    color:
                        isDarkMode
                            ? AppColors.greyScale.grey600
                            : AppColors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat('25', 'Courses'),
                    _buildStat('22,379', 'Students'),
                    _buildStat('9,287', 'Reviews'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.message, color: AppColors.white),
                      label: Text(
                        'Message',
                        style: TextStyle(color: AppColors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.language, color: Colors.blue),
                      label: Text(
                        'Website',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // TabBar
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Courses'),
              Tab(text: 'Students'),
              Tab(text: 'Reviews'),
            ],
          ),
          // TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCoursesTab(),
                _buildStudentsTab(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return _buildReviewsTab(reviews[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildCoursesTab() {
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
                            style: TextStyle(
                              color: AppColors.greyScale.grey900,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${course['students']} students',
                            style: TextStyle(
                              color: AppColors.greyScale.grey600,
                            ),
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
    );
  }

  Widget _buildStudentsTab() {
    List students = [
      {
        'name': 'Benny Spankbauer',
        'role': 'Student',
        'avatar': 'https://via.placeholder.com/50',
      },
      {
        'name': 'Freida Vannes',
        'role': 'Junior Designer',
        'avatar': 'https://via.placeholder.com/50',
      },
      {
        'name': 'Francesca Vandyne',
        'role': 'Student',
        'avatar': 'https://via.placeholder.com/50',
      },
      {
        'name': 'Tanner Stafford',
        'role': 'Freelancer',
        'avatar': 'https://via.placeholder.com/50',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: students.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> student = students[index];
        return Card(
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(student['avatar']),
              radius: 20,
            ),
            title: Text(student['name']),
            subtitle: Text(student['role']),
            trailing: Icon(IconlyLight.chat, color: Colors.blue),
          ),
        );
      },
    );
  }

  Widget _buildReviewsTab(Map<String, dynamic> review) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();
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
  }
}
