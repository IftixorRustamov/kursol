import 'package:go_router/go_router.dart';
import 'package:kursol/features/transaction/pages/e_receipt_page.dart';
import 'package:kursol/features/transaction/pages/transactions_page.dart';
import '../../features/my_course/presentation/pages/course_detail_page.dart';
import '../../features/my_course/presentation/pages/my_course_page.dart';
import '../../features/my_course/presentation/pages/video_player_page.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.eReceipt,
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
      path: RoutePaths.transactions,
      name: RouteNames.transactions,
      builder: (context, state) => const TransactionsPage(),
    ),
    GoRoute(
      path: RoutePaths.eReceipt,
      name: RouteNames.eReceipt,
      builder: (context, state) => const EReceiptPage(),
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
      path: RoutePaths.completedCourses,
      name: RouteNames.completedCourses,
      builder: (context, state) {
        final courseId = state.extra as String? ?? '';
        return CompletedCoursePage(courseId: courseId);
      },
    ),
    GoRoute(
      path: RoutePaths.videoPlayer,
      name: RouteNames.videoPlayer,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>? ?? {};
        return VideoPlayerPage(
          videoUrl: args['videoUrl'] ?? '',
          title: args['title'] ?? 'Untitled',
        );
      },
    ),


  ],
);
