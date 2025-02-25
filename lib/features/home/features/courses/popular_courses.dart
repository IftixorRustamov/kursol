import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../widgets/course_card_widget.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
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
      appBar: ActionAppBarWg(
        onBackPressed: () => Navigator.pop(context),
        titleText: "Most Popular Courses",
        actions: [
          IconButton(
            icon: Icon(IconlyLight.search, size: appH(28)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(14)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: appH(10)),
              // ! Category check bar
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
              // ! Category check bar
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return CourseCard(
                    onTap: () {},
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
}
