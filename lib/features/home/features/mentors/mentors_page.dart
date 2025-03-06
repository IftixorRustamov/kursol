import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import '../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../widgets/chats_widget.dart';

class MentorsPage extends StatelessWidget {
  const MentorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () => Navigator.pop(context),
        titleText: "Top Mentors",
        actions: [
          IconButton(icon: const Icon(IconlyLight.search), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return ChatsWidget(
              imagePath: 'assets/images/boy.png',
              name: 'Mentor',
              jobTitle: 'Specialist in Field',
            );
          },
        ),
      ),
    );
  }
}
