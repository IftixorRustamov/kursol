import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _selectedRating = 4;
  String _selectedFeedback = "The courses & mentors are great! 🔥";
  final List<String> feedbackOptions = [
    "The courses & mentors are great! 🔥",
    "The content was well-structured",
    "I learned a lot!",
    "It could be improved",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primary(),
              child: Icon(Icons.edit, color: AppColors.primary(), size: 40),
            ),
            const SizedBox(height: 20),
            Text(
              "Course Completed!",
              style: TextStyle(
                color: AppColors.primary(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please leave a review for your course.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedRating ? Icons.star : Icons.star_border,
                    color: AppColors.primary(),
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedRating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedFeedback,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items:
                  feedbackOptions.map((feedback) {
                    return DropdownMenuItem(
                      value: feedback,
                      child: Text(feedback),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFeedback = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 30,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Write Review",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: AppColors.primary(), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
