import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/features/course_details/presentation/pages/course_deatils_tabs/reviews_tab.dart';
import 'package:kursol/features/course_details/presentation/pages/mentor_profile_tabs/courses_tab.dart';
import 'package:kursol/features/course_details/presentation/pages/mentor_profile_tabs/students_tab.dart';

import '../../../../core/common/constants/colors/app_colors.dart';
import '../widgets/StatWidget.dart';

class MentorProfilePage extends StatefulWidget {
  @override
  _MentorProfilePageState createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> with SingleTickerProviderStateMixin {
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
          icon: Icon(IconlyLight.arrow_left, color: isDarkMode ? AppColors.white : AppColors.black,size: 28,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(IconlyLight.more_circle, color: isDarkMode ? AppColors.white : AppColors.black,size: 28,),
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
                  backgroundImage: NetworkImage('https://via.placeholder.com/100'),
                ),
                SizedBox(height: 16),
                Text(
                  'Jonathan Williams',
                  style: urbanistTextStyles.bold(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    fontSize: 24,
                  ),
                ),
                Text('Senior UI/UX Designer at Google',style: urbanistTextStyles.bold(
                  color: isDarkMode ? AppColors.greyScale.grey600 : AppColors.black,
                  fontSize: 14,
                ),),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatWidget(value: '25', label: 'Courses'),
                    StatWidget(value: '22,379', label: 'Students'),
                    StatWidget(value: '9,287', label: 'Reviews'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.message, color: AppColors.white),
                      label: Text('Message', style: TextStyle(color: AppColors.white)),
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
                      label: Text('Website', style: TextStyle(color: Colors.blue)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue,width: 2),
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
                CoursesTab(),
                StudentsTab(),
                ReviewsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

