import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/routes/route_paths.dart';

import '../../../../../config/gen/assets.gen.dart' show Assets;
import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/utils_export.dart';
import 'widgets/boarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> texts = [
    "We provide the best learning courses & great mentors!",
    "Learn anytime and anywhere easily and conveniently",
    "Let's improve your skills together with Elera right now!",
  ];

  final List<Widget> images = [
    Assets.images.splash3.image(height: appH(320), width: appW(320)),
    Assets.images.splash4.image(height: appH(320), width: appW(320)),
    Assets.images.splash5.image(height: appH(320), width: appW(320)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: scaffoldPadding48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: appH(60),
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: texts.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => BoardingWidget(
                  text: texts[index],
                  image: images[index],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(texts.length, (index) => _buildDot(index)),
            ),
            DefaultButtonWg(
                title: _currentPage == texts.length - 1
                    ? AppStrings.getStarted
                    : AppStrings.next,
                onPressed: () {
                  if (_currentPage < texts.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                  if (_currentPage == texts.length - 1) {
                    context.go(RoutePaths.auth);
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: appW(5)),
      width: _currentPage == index ? appW(32) : appW(8),
      height: appH(8),
      decoration: BoxDecoration(
        color: _currentPage == index
            ? AppColors.primary()
            : AppColors.greyScale.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
