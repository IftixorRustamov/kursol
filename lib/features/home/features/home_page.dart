import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/routes/route_names.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/home/features/widgets/course_card_widget.dart';
import '../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../core/utils/responsiveness/app_responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<String> options = [
    '🔥 All',
    '💡 3D Design',
    '💰 Business',
    '🎨 Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        toolbarHeight: appH(100),
        title: Row(
          children: [
            CircleAvatar(
              radius: appH(30),
              backgroundImage: AssetImage('assets/images/boy.png'),
            ),
            SizedBox(width: appW(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Good Morning 👋',
                  style: UrbanistTextStyles().medium(
                    color: AppColors.greyScale.grey600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: appH(10)),
                Text(
                  'Andrew Ainsley',
                  style: UrbanistTextStyles().semiBold(
                    color: AppColors.greyScale.grey900,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(IconlyLight.notification, size: appH(28)),
            onPressed: () {
              context.pushNamed(RouteNames.homeNotification);
            },
          ),
          IconButton(
            icon: Icon(IconlyLight.bookmark, size: appH(28)),
            onPressed: () {
              context.pushNamed(RouteNames.homeBookmark);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: appH(56),
                decoration: BoxDecoration(
                  color: AppColors.greyScale.grey100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(16),
                      vertical: appH(12),
                    ),
                  ),
                  onPressed: () {
                    context.pushNamed(RouteNames.homeSearch);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        IconlyLight.search,
                        size: appH(20),
                        color: AppColors.greyScale.grey400,
                      ),
                      SizedBox(width: appW(20)),
                      Text(
                        'Search',
                        style: UrbanistTextStyles().semiBold(
                          color: AppColors.greyScale.grey400,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        IconlyLight.filter,
                        size: appH(20),
                        color: AppColors.primary.blue400,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: appH(10)),
              SizedBox(
                width: double.infinity,
                height: appH(210),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/Frame.png', fit: BoxFit.cover),
                    Image.asset('assets/images/Frame.png', fit: BoxFit.cover),
                    Image.asset('assets/images/Frame.png', fit: BoxFit.cover),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Mentors",
                    style: UrbanistTextStyles().bold(
                      fontSize: 20,
                      color: AppColors.greyScale.grey900,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.homeMentors);
                    },
                    child: Text(
                      "See All",
                      style: UrbanistTextStyles().bold(
                        fontSize: 16,
                        color: AppColors.primary.blue500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: appH(10)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: [
                        _column('assets/images/boy.png', 'Jacob'),
                        _column('assets/images/boy.png', 'Claire'),
                        _column('assets/images/boy.png', 'Priscilla'),
                        _column('assets/images/boy.png', 'Wade'),
                        _column('assets/images/boy.png', 'Kathryn'),
                        _column('assets/images/boy.png', 'Alice'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: appH(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular Courses",
                    style: UrbanistTextStyles().bold(
                      fontSize: 20,
                      color: AppColors.greyScale.grey900,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.homePopularCourses);
                    },
                    child: Text(
                      "See All",
                      style: UrbanistTextStyles().bold(
                        fontSize: 16,
                        color: AppColors.primary.blue500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: appH(10)),
              SizedBox(
                height: appH(40),
                child: ListView.builder(
                  itemCount: options.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CustomChoiceChipWg(
                    index: index,
                    label: options[index],
                    selectedIndex: selectedIndex,
                    onSelected: (selected) {
                      setState(() {
                        selectedIndex = selected ? index : selectedIndex;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: appH(8)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CourseCard(
                    onTap: () => context.pushNamed(RouteNames.courseDetails),
                    imagePath: 'assets/images/Rectangle2.png',
                    category: 'Entrepreneurship',
                    title: 'Digital Entrepreneur...',
                    price: 39,
                    oldPrice: 80,
                    rating: 4.8,
                    students: 8289,
                    onBookmarkPressed: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _column(String imagePath, String name) {
    return Container(
      margin: EdgeInsets.only(right: appW(15)),
      child: Column(
        children: [
          CircleAvatar(radius: 36, backgroundImage: AssetImage(imagePath)),
          SizedBox(height: appH(8)),
          Text(
            name,
            style: UrbanistTextStyles().semiBold(
              fontSize: 16,
              color: AppColors.greyScale.grey900,
            ),
          ),
        ],
      ),
    );
  }
}
