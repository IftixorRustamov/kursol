import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/common/widgets/custom_tab_bar_wg.dart';

class TestResultPage extends StatefulWidget {
  final String testTitle;
  final String testImage;
  final int correctAnswers;
  final int incorrectAnswers;
  final int unanswered;

  const TestResultPage({
    super.key,
    required this.testTitle,
    required this.testImage,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.unanswered,
  });

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          widget.testTitle,
          style: UrbanistTextStyles().bold(
            color: isDarkMode ? AppColors.white : AppColors.black,
            fontSize: appH(22),
          ),
        ),
        backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            size: appH(28),
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: appH(20)),
            _buildTestSummary(isDarkMode),
            SizedBox(height: appH(20)),
            _buildActionButtons(isDarkMode),
            SizedBox(height: appH(20)),
            CustomTabBar(
              tabTitles: ["Testlar", "Course", "Reviews"],
              tabController: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTestList(),
                  Center(child: Text("Course Content", style: UrbanistTextStyles().bold(fontSize: appH(18), color: AppColors.blue))),
                  Center(child: Text("Reviews", style: UrbanistTextStyles().bold(fontSize: appH(18), color: AppColors.blue))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestSummary(bool isDarkMode) {
    return Column(
      children: [
        CircleAvatar(
          radius: appH(50),
          backgroundImage: AssetImage(widget.testImage),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(height: appH(12)),
        Text(
          "${widget.testTitle} natijalari",
          style: UrbanistTextStyles().bold(
            color: isDarkMode ? AppColors.white : AppColors.black,
            fontSize: appH(20),
          ),
        ),
        SizedBox(height: appH(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildResultItem("${widget.correctAnswers}", "To‘g‘ri javoblar", AppColors.black),
            _buildResultItem("${widget.incorrectAnswers}", "Noto‘g‘ri javoblar", AppColors.black),
            _buildResultItem("${widget.unanswered}", "Belgilanmaganlar", AppColors.black),
          ],
        ),
      ],
    );
  }

  Widget _buildResultItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: UrbanistTextStyles().bold(
            color: color,
            fontSize: appH(22),
          ),
        ),
        Text(
          label,
          style: UrbanistTextStyles().regular(
            color: AppColors.greyScale.grey700,
            fontSize: appH(14),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(IconlyLight.message, "Message", isDarkMode),
        SizedBox(width: appW(12)),
        _buildActionButton(IconlyLight.lock, "Website", isDarkMode),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, bool isDarkMode) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(12)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appH(30))),
        backgroundColor: isDarkMode ? AppColors.background.dark2 : AppColors.white,
        side: BorderSide(color: AppColors.primary.blue500, width: 1),
      ),
      icon: Icon(icon, color: AppColors.primary.blue500),
      label: Text(
        label,
        style: UrbanistTextStyles().semiBold(
          color: AppColors.primary.blue500,
          fontSize: appH(16),
        ),
      ),
      onPressed: () {
        print("$label pressed");
      },
    );
  }

  Widget _buildTestList() {
    return ListView(
      padding: EdgeInsets.only(top: appH(16)),
      children: [
        _buildTestCard("assets/courses/sat.png", "SAT", "100 ta savol", 4.7, 7938),
        _buildTestCard("assets/courses/ielts.png", "IELTS", "40 ta savol", 4.1, 9927),
      ],
    );
  }

  Widget _buildTestCard(String imagePath, String title, String questionCount, double rating, int students) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: appH(16)),
      padding: EdgeInsets.all(appH(16)),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.background.dark2 : AppColors.white,
        borderRadius: BorderRadius.circular(appH(16)),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyScale.grey300.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: appH(60), height: appH(60)),
          SizedBox(width: appW(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: UrbanistTextStyles().bold(fontSize: appH(18), color: isDarkMode ? AppColors.white : AppColors.black)),
                Text(questionCount, style: UrbanistTextStyles().regular(fontSize: appH(14), color: AppColors.greyScale.grey600)),
              ],
            ),
          ),
          Icon(IconlyLight.bookmark, size: appH(24), color: AppColors.greyScale.grey700),
        ],
      ),
    );
  }
}
