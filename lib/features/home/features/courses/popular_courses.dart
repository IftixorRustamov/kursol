import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../widgets/category_button_widget.dart';
import '../widgets/course_card_widget.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  String selectedCategory = "All";

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton(
                      category: 'All',
                      label: '🔥 All',
                      onSelected: _onCategorySelected,
                      selectedCategory: selectedCategory,
                    ),
                    CategoryButton(
                      category: '3D Design',
                      label: '💡 3D Design',
                      onSelected: _onCategorySelected,
                      selectedCategory: selectedCategory,
                    ),
                    CategoryButton(
                      category: 'Business',
                      label: '💰 Business',
                      onSelected: _onCategorySelected,
                      selectedCategory: selectedCategory,
                    ),
                    CategoryButton(
                      category: 'Design',
                      label: '🎨 Design',
                      onSelected: _onCategorySelected,
                      selectedCategory: selectedCategory,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return CourseCard(
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
