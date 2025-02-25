import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/video_player_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/course_details/presentation/widgets/CourseLessonWidget.dart';
import 'package:kursol/features/course_details/presentation/widgets/course_info_widget.dart';
import 'package:kursol/features/my_course/domain/entities/course_detail.dart';
import '../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../my_course/data/repositories/dummy_course_details.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();
    List<CourseSection> courseDetail =
        dummyCourseDetails.firstWhere((course) => course.id == '1').sections;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Course Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomVideoPlayer(
                    videoUrl:
                        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intro to UI/UX Design',
                        style: urbanistTextStyles.bold(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: 32,
                        ),
                      ),
                      Icon(IconlyLight.bookmark, color: AppColors.blue),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.lightBlue,
                        ),
                        child: Text(
                          'UI/UX Design',
                          style: urbanistTextStyles.bold(
                            color: AppColors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Icon(IconlyBold.star, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text(
                        '4.8 (4,479 reviews)',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$40',
                        style: urbanistTextStyles.bold(
                          color: AppColors.blue,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '\$75',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blueGrey,
                          decoration: TextDecoration.lineThrough,
                          fontFamily: "Urbanist",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CourseInfoWidget(
                        icon: Icon(
                          IconlyBold.user_3,
                          color: AppColors.blue,
                          size: 20,
                        ),
                        title: '9,839 Students',
                      ),
                      CourseInfoWidget(
                        icon: Icon(
                          IconlyBold.time_circle,
                          color: AppColors.blue,
                          size: 16,
                        ),
                        title: '2.5 Hours',
                      ),
                      CourseInfoWidget(
                        icon: Icon(
                          IconlyBold.document,
                          color: AppColors.blue,
                          size: 20,
                        ),
                        title: 'Certificate',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tabs
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Lessons'),
                Tab(text: 'Reviews'),
              ],
            ),
            // TabBarView
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // About Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mentor',
                          style: urbanistTextStyles.bold(
                            fontSize: 26,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
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
                                fontSize: 22,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            subtitle: Text(
                              'Senior UI/UX Designer at Google',
                              style: urbanistTextStyles.bold(
                                fontSize: 16,
                                color: AppColors.greyScale.grey500,
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
                            fontSize: 20,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip. ",
                          style: urbanistTextStyles.bold(
                            fontSize: 16,
                            color: AppColors.greyScale.grey500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Tools',
                          style: urbanistTextStyles.bold(
                            fontSize: 20,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset('assets/images/figma_logo.png'),
                            const SizedBox(width: 5),
                            Text(
                              "Figma",
                              style: urbanistTextStyles.semiBold(
                                fontSize: 16,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Lessons Tab
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '124 Lessons',
                                style: urbanistTextStyles.bold(
                                  fontSize: 20,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
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
                          CourseLessonWidget(
                            sections: courseDetail,
                            isDarkMode: isDarkMode,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Reviews Tab
                  ReviewsScreen(),
                ],
              ),
            ),
            // Enroll Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Enroll Course - \$440",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
    int selectedRatingIndex = 0;

    final List<String> optionsRating = [
      'All',
      '5',
      '4',
      '3',
      '2',
      '1',
    ];
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
          //! Rating check bar
          SizedBox(
            height: appH(40),
            child: ListView.builder(
              itemCount: optionsRating.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomChoiceChipWg(
                showIcon: true,
                index: index,
                label: optionsRating[index],
                selectedIndex: selectedRatingIndex,
                onSelected: (selected) {
                  setState(() {
                    selectedRatingIndex =
                        selected ? index : selectedRatingIndex;
                  });
                },
              ),
            ),
          ),
          //! Rating check bar
          // Rating Filters
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       _buildFilterButton('All', 0),
          //       _buildFilterButton('5', 1),
          //       _buildFilterButton('4', 2),
          //       _buildFilterButton('3', 3),
          //       _buildFilterButton('2', 4),
          //       _buildFilterButton('1', 5),
          //     ],
          //   ),
          // ),

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

  // Widget _buildFilterButton(String text, int index) {
  //   final theme = Theme.of(context);
  //   final _ = theme.brightness == Brightness.dark;
  //   UrbanistTextStyles urbanistTextStyles = UrbanistTextStyles();
  //
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 8.0),
  //     child: ElevatedButton(
  //       onPressed: () {
  //         setState(() {
  //           _selectedFilter = index;
  //         });
  //       },
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor:
  //             _selectedFilter == index ? AppColors.blue : Colors.transparent,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //           side:
  //               _selectedFilter == index
  //                   ? BorderSide.none
  //                   : BorderSide(color: AppColors.blue, width: 2.0),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           if (text != 'All')
  //             Icon(
  //               Icons.star,
  //               color:
  //                   _selectedFilter == index ? AppColors.white : AppColors.blue,
  //               size: 16,
  //             ),
  //           SizedBox(width: text != 'All' ? 4 : 0),
  //           Text(
  //             text,
  //             style: urbanistTextStyles.bold(
  //               color:
  //                   _selectedFilter == index ? AppColors.white : AppColors.blue,
  //               fontSize: 16,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
