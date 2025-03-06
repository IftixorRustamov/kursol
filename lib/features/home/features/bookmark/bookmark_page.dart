import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import '../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../core/utils/textstyles/urbanist_textstyles.dart';
import '../widgets/course_card_widget.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
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
        titleText: "My Bookmark",
        actions: [
          IconButton(
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(14)),
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
            Expanded(
              child: ListView.builder(
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
                    onBookmarkPressed: () {
                      _modalBottomSheetMenu(
                        'Digital Entrepreneur...',
                        'Entrepreneurship',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(String title, String category) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: appH(402),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: appH(10)),
              Text(
                "Remove from Bookmark?",
                style: UrbanistTextStyles().bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: appH(10)),
              Divider(thickness: 1, color: AppColors.greyScale.grey200),
              CourseCard(
                onTap: () {},
                imagePath: 'assets/images/Rectangle2.png',
                category: 'Entrepreneurship',
                title: 'Digital Entrepreneur...',
                price: 39,
                oldPrice: 80,
                rating: 4.8,
                students: 8289,
                onBookmarkPressed: () {},
              ),
              SizedBox(height: appH(20)),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary.blue100,
                        padding: EdgeInsets.symmetric(horizontal: appW(30)),
                        minimumSize: const Size(0, 58),
                      ),
                      child: Text(
                        "Cancel",
                        style: UrbanistTextStyles().bold(
                          color: AppColors.primary.blue500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: appW(10)),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary.blue500,
                        padding: EdgeInsets.symmetric(horizontal: appW(30)),
                        minimumSize: const Size(0, 58),
                      ),
                      child: Text(
                        "Yes, Remove",
                        style: UrbanistTextStyles().bold(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
