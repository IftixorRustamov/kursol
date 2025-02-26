import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/utils/textstyles/urbanist_textstyles.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';

class QuestionCard extends StatefulWidget {
  final int questionNumber;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  const QuestionCard({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? _selectedIndex;

  void _onOptionSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.background.dark2 : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? AppColors.background.dark3.withOpacity(0.3)
                : AppColors.greyScale.grey300,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Savol Raqami (01, 02, ...)**
          Row(
            children: [
              CircleAvatar(
                backgroundColor: isDarkMode
                    ? AppColors.primary.blue500.withOpacity(0.2)
                    : AppColors.primary.blue200.withOpacity(0.2),
                radius: appH(24),
                child: Text(
                  widget.questionNumber.toString().padLeft(2, '0'),
                  style: UrbanistTextStyles().bold(
                    color: AppColors.primary.blue500,
                    fontSize: appH(18),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.questionText,
                  style: UrbanistTextStyles().bold(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// **Variantlar Ro‘yxati**
          Column(
            children: List.generate(widget.options.length, (index) {
              bool isCorrect = index == widget.correctAnswerIndex;
              bool isSelected = _selectedIndex == index;

              return GestureDetector(
                onTap: () => _onOptionSelected(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? (isCorrect
                        ? AppColors.primary.blue400
                        : AppColors.red.withOpacity(0.8))
                        : (isDarkMode ? AppColors.background.dark3 : AppColors.greyScale.grey100),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        String.fromCharCode(65 + index), // A, B, C, D...
                        style: UrbanistTextStyles().bold(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.greyScale.grey700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.options[index],
                          style: UrbanistTextStyles().medium(
                            color: isSelected
                                ? AppColors.white
                                : (isDarkMode ? AppColors.white : AppColors.black),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
