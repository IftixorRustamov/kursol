import 'package:go_router/go_router.dart';
import '../../features/my_course/presentation/pages/course_detail_page.dart';
import '../../features/my_course/presentation/pages/my_course_page.dart';
import '../../features/my_course/presentation/pages/video_player_page.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  routes: [
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const MyCoursePage(),
    ),
    GoRoute(
      path: RoutePaths.courseDetail,
      name: RouteNames.courseDetail,
      builder: (context, state) {
        final String courseId = state.pathParameters['id'] ?? '';
        return CourseDetailPage(courseId: courseId);
      },
    ),
    GoRoute(
      path: RoutePaths.videoPlayer,
      name: RouteNames.videoPlayer,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return VideoPlayerPage(videoUrl: args['videoUrl'], title: args['title']);
      },
    ),
  ],
);
