import 'package:flutter/material.dart';
import 'package:kursol/features/test/widgets/question_card.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        return QuestionCard(
          questionNumber: index + 1,
          questionText: "(x - 3)(x + 4) = 0 tenglamasining yechimlari qanday?",
          options: [
            "x=3 yoki x=-4x = -4x=-4",
            "x=-3x = -3x=-3 yoki x=4x = 4x=4",
            "x=3x = 3x=3 yoki x=4x = 4x=4",
            "x=-3x = -3x=-3 yoki x=-4x = -4x=-4",
          ],
          correctAnswerIndex: 0,
        );
      },
    );
  }
}
