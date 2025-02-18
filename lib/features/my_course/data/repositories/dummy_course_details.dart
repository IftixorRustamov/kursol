import '../../domain/entities/course_detail.dart';
import '../models/course_detail_model.dart';

final List<CourseDetailModel> dummyCourseDetails = [
  CourseDetailModel(
    id: '1',
    title: 'Intro to UI/UX Design',
    sections: [
      CourseSection(
        title: 'Section 1 - Introduction',
        duration: '15 mins',
        lessons: [
          Lesson(id: '01', title: 'Why Using Figma', duration: '10 mins', isLocked: false),
          Lesson(id: '02', title: 'Set up Your Figma Account', duration: '5 mins', isLocked: false),
        ],
      ),
      CourseSection(
        title: 'Section 2 - Figma Basic',
        duration: '60 mins',
        lessons: [
          Lesson(id: '03', title: 'Take a Look Figma Interface', duration: '15 mins', isLocked: false),
          Lesson(id: '04', title: 'Working with Frame & Layer', duration: '10 mins', isLocked: true),
          Lesson(id: '05', title: 'Working with Text & Grids', duration: '10 mins', isLocked: true),
          Lesson(id: '06', title: 'Using Figma Plugins', duration: '25 mins', isLocked: true),
          Lesson(id: '07', title: 'Using Figma Plugins', duration: '25 mins', isLocked: true),
          Lesson(id: '08', title: 'Using Figma Plugins', duration: '25 mins', isLocked: true),
          Lesson(id: '09', title: 'Using Figma Plugins', duration: '25 mins', isLocked: true),
          Lesson(id: '10', title: 'Using Figma Plugins', duration: '25 mins', isLocked: true),
          Lesson(id: '11', title: 'Using Figma Plugins', duration: '25 mins', isLocked: true),

        ],
      ),
    ],
  ),
];
