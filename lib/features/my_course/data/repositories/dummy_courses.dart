import '../models/course_model.dart';

final List<CourseModel> ongoingCourses = [
  CourseModel(
    id: '1',
    title: 'Intro to UI/UX Design',
    duration: '2 hrs 30 mins',
    imageUrl: 'assets/courses/ui.png',
    progress: 75,
  ),
  CourseModel(
    id: '2',
    title: 'WordPress Website Development',
    duration: '3 hrs 15 mins',
    imageUrl: 'assets/courses/wordpress.png',
    progress: 50,
  ),
  CourseModel(
    id: '3',
    title: '3D Blender and UI/UX',
    duration: '2 hrs 48 mins',
    imageUrl: 'assets/courses/blender.png',
    progress: 25,
  ),
  CourseModel(
    id: '4',
    title: 'Learn UX User Persona',
    duration: '2 hrs 35 mins',
    imageUrl: 'assets/courses/pearsona.png',
    progress: 60,
  ),
];

final List<CourseModel> completedCourses = [
  CourseModel(
    id: '5',
    title: '3D Design Illustration',
    duration: '2 hrs 25 mins',
    imageUrl: 'assets/courses/3d.png',
    progress: 114,
  ),
  CourseModel(
    id: '6',
    title: 'CRM Management for Dummies',
    duration: '3 hrs 20 mins',
    imageUrl: 'assets/courses/crm.png',
    progress: 114,
  ),
  CourseModel(
    id: '7',
    title: 'Flutter Mobile Apps',
    duration: '4 hrs 50 mins',
    imageUrl: 'assets/courses/flutter.png',
    progress: 114,
  ),
  CourseModel(
    id: '8',
    title: '3D Icons Set Blender',
    duration: '2 hrs 45 mins',
    imageUrl: 'assets/courses/3d_icons.png',
    progress: 114,
  ),
];
