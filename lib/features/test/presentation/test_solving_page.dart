import 'package:flutter/material.dart';
import 'package:kursol/features/test/widgets/question_list.dart';
import 'package:kursol/features/test/widgets/finish_test_button.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/features/test/widgets/timer_indicator.dart';
import 'package:go_router/go_router.dart';
class TestSolvingPage extends StatefulWidget {
  final String subject;

  const TestSolvingPage({super.key, required this.subject});

  @override
  _TestSolvingPageState createState() => _TestSolvingPageState();
}

class _TestSolvingPageState extends State<TestSolvingPage> {
  int _secondsRemaining = 60 * 60; // 60:00 daqiqa

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.background.dark : AppColors.white,
      appBar: TestAppBarWithTimer(
        subject: widget.subject,
        secondsRemaining: _secondsRemaining,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark2 : AppColors.greyScale.grey100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: const QuestionList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FinishTestButton(
          onPressed: () {
            context.push(
              '/test-result',
              extra: {
                'testTitle': 'DTM',
                'testImage': 'assets/courses/dtm.png',
                'correctAnswers': 43,
                'incorrectAnswers': 24,
                'unanswered': 2,
              },
            );
          },
        ),

      ),
    );
  }
}
