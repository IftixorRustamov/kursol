import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/utils/logger/app_logger.dart';
import 'package:kursol/features/home/main_page.dart';
import 'package:kursol/features/profile/features/edit_profile/edit_profile_page.dart';
import 'package:kursol/features/profile/profile_page.dart';
import 'package:kursol/features/transaction/pages/e_receipt_page.dart';
import 'package:kursol/features/transaction/pages/transactions_page.dart';
import '../../features/my_course/presentation/pages/completed_course_page.dart';
import '../../features/my_course/presentation/pages/my_course_page.dart';
import '../../features/my_course/presentation/pages/ongoing_course_page.dart';
import '../../features/my_course/presentation/pages/video_player_page.dart';
import 'route_names.dart';
import 'route_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [MyNavigatorObserver()],
  initialLocation: RoutePaths.home,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainPage(child: child),
      routes: [
        // * home
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MyCoursePage(),
        ),

        // * Inbox
        GoRoute(
          path: RoutePaths.inbox,
          name: RouteNames.inbox,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MyCoursePage(),
        ),

        // * My Course
        GoRoute(
          path: RoutePaths.myCourse,
          name: RouteNames.myCourse,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MyCoursePage(),
        ),

        // * Transactions
        GoRoute(
          path: RoutePaths.transactions,
          name: RouteNames.transactions,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const TransactionsPage(),
        ),

        // *   Profile
        GoRoute(
          path: RoutePaths.profile,
          name: RouteNames.profile,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const ProfilePage(),
          routes: <RouteBase>[
            // * Edit Profile
            GoRoute(
              path: RoutePaths.editProfile,
              name: RouteNames.editProfile,
              // parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EditProfilePage(),
            ),
          ],
        ),
      ],
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

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.i('did push route $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.i('did pop route $route');
  }
}
