import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

class TestAppBarWithTimer extends StatefulWidget implements PreferredSizeWidget {
  final String subject;
  final int secondsRemaining;

  const TestAppBarWithTimer({
    super.key,
    required this.subject,
    required this.secondsRemaining,
  });

  @override
  _TestAppBarWithTimerState createState() => _TestAppBarWithTimerState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TestAppBarWithTimerState extends State<TestAppBarWithTimer> {
  late Timer _timer;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.secondsRemaining;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDarkMode ? AppColors.background.dark2 : AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        widget.subject,
        style: AppTextStyles.urbanist.bold(
          color: isDarkMode ? AppColors.white : AppColors.black,
          fontSize: 24,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          IconlyLight.arrow_left,
          size: appH(28),
          color: isDarkMode ? AppColors.white : AppColors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CircularPercentIndicator(
            radius: 24.0,
            lineWidth: 5.0,
            percent: (_remainingSeconds / widget.secondsRemaining).clamp(0.0, 1.0),
            center: Text(
              _formatTime(_remainingSeconds),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            progressColor: AppColors.primary(),
            backgroundColor: AppColors.greyScale.grey300,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
      ],
    );
  }
}
