import 'package:flutter/material.dart';
import '../widgets/course_card_widget.dart';

class CoursesBody extends StatelessWidget {
  const CoursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return CourseCard(
          onTap: (){},
          imagePath: 'assets/images/Rectangle2.png',
          category: 'Entrepreneurship',
          title: 'Digital Entrepreneur...',
          price: 39,
          oldPrice: 80,
          rating: 4.8,
          students: 8289,
          onBookmarkPressed: () {},
        );
      },
    );
  }
}
