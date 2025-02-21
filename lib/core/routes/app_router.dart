import 'package:go_router/go_router.dart';
import 'package:kursol/features/course_details/presentation/pages/mentor_profile.dart';
import '../../features/course_details/presentation/pages/course_details.dart';
import '../../features/my_course/presentation/pages/my_course_page.dart';
import '../../features/my_course/presentation/pages/ongoing_course_page.dart';
import '../../features/my_course/presentation/pages/video_player_page.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.courseDetails,
  routes: [
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const MyCoursePage(),
    ),
    GoRoute(
      path: RoutePaths.myCourse,
      name: RouteNames.myCourse,
      builder: (context, state) => const MyCoursePage(),
    ),
    GoRoute(
      path: RoutePaths.courseDetail,
      name: RouteNames.courseDetail,
      builder: (context, state) {
        final courseId = state.pathParameters['id'] ?? '';
        return OngoingCourse(courseId: courseId);
      },
    ),
    GoRoute(
      path: RoutePaths.videoPlayer,
      name: RouteNames.videoPlayer,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;
        return VideoPlayerPage(
          videoUrl: args?['videoUrl'] ?? '',
          title: args?['title'] ?? 'Untitled',
        );
      },
    ),
    GoRoute(
      path: RoutePaths.courseDetails,
      name: RouteNames.courseDetails,
      builder: (context, state) {
        return CourseDetailsPage();
      },
    ),
    GoRoute(
      path: RoutePaths.mentorProfile,
      name: RouteNames.mentorProfile,
      builder: (context, state) {
        return MentorProfilePage();
      },
    ),
  ],
);
