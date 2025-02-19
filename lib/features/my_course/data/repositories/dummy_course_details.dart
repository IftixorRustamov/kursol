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

  // Completed Courses Dummy Data
  CourseDetailModel(
    id: '5',
    title: '3D Design Illustration',
    sections: [
      CourseSection(
        title: 'Section 1 - Introduction',
        duration: '17 mins',
        lessons: [
          Lesson(id: '01', title: 'Why Using 3D Blender', duration: '10 mins', isLocked: false),
          Lesson(id: '02', title: '3D Blender Installation', duration: '7 mins', isLocked: false),
        ],
      ),
      CourseSection(
        title: 'Section 2 - Blender 3D Modelling',
        duration: '125 mins',
        lessons: [
          Lesson(id: '03', title: 'Take a Look Blender Interface', duration: '15 mins', isLocked: false),
          Lesson(id: '04', title: 'The Basic of 3D Modelling', duration: '25 mins', isLocked: false),
          Lesson(id: '05', title: 'Shading and Lighting', duration: '20 mins', isLocked: false),
        ],
      ),
    ],
  ),

  CourseDetailModel(
    id: '6',
    title: 'CRM Management for Dummies',
    sections: [
      CourseSection(
        title: 'Section 1 - Introduction to CRM',
        duration: '30 mins',
        lessons: [
          Lesson(id: '01', title: 'What is CRM?', duration: '10 mins', isLocked: false),
          Lesson(id: '02', title: 'CRM Benefits', duration: '20 mins', isLocked: false),
        ],
      ),
      CourseSection(
        title: 'Section 2 - Using CRM Tools',
        duration: '90 mins',
        lessons: [
          Lesson(id: '03', title: 'Understanding CRM Software', duration: '30 mins', isLocked: false),
          Lesson(id: '04', title: 'Customer Data Management', duration: '30 mins', isLocked: false),
          Lesson(id: '05', title: 'Sales and Lead Tracking', duration: '30 mins', isLocked: false),
        ],
      ),
    ],
  ),

  CourseDetailModel(
    id: '7',
    title: 'Flutter Mobile Apps',
    sections: [
      CourseSection(
        title: 'Section 1 - Flutter Basics',
        duration: '45 mins',
        lessons: [
          Lesson(id: '01', title: 'Introduction to Flutter', duration: '15 mins', isLocked: false),
          Lesson(id: '02', title: 'Setting up Flutter Environment', duration: '10 mins', isLocked: false),
          Lesson(id: '03', title: 'Building First Flutter App', duration: '20 mins', isLocked: false),
        ],
      ),
      CourseSection(
        title: 'Section 2 - UI Components',
        duration: '80 mins',
        lessons: [
          Lesson(id: '04', title: 'Using Widgets', duration: '30 mins', isLocked: false),
          Lesson(id: '05', title: 'State Management Basics', duration: '50 mins', isLocked: false),
        ],
      ),
    ],
  ),

  CourseDetailModel(
    id: '8',
    title: '3D Icons Set Blender',
    sections: [
      CourseSection(
        title: 'Section 1 - Getting Started',
        duration: '20 mins',
        lessons: [
          Lesson(id: '01', title: 'Blender Interface Basics', duration: '10 mins', isLocked: false),
          Lesson(id: '02', title: 'Modeling Simple Shapes', duration: '10 mins', isLocked: false),
        ],
      ),
      CourseSection(
        title: 'Section 2 - Icon Design',
        duration: '120 mins',
        lessons: [
          Lesson(id: '03', title: 'Creating 3D Icons', duration: '40 mins', isLocked: false),
          Lesson(id: '04', title: 'Lighting & Texturing', duration: '40 mins', isLocked: false),
          Lesson(id: '05', title: 'Rendering & Exporting', duration: '40 mins', isLocked: false),
        ],
      ),
    ],
  ),
];
