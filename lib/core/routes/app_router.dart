import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/utils/logger/app_logger.dart';
import 'package:kursol/features/auth/profile/presentation/pages/create_new_password.dart';
import 'package:kursol/features/auth/profile/presentation/pages/create_new_pin.dart';
import 'package:kursol/features/auth/profile/presentation/pages/fill_your_profile.dart';
import 'package:kursol/features/auth/profile/presentation/pages/finger_print.dart';
import 'package:kursol/features/auth/profile/presentation/pages/forgot_password.dart';
import 'package:kursol/features/auth/profile/presentation/pages/send_code_forgot_password.dart';
import 'package:kursol/features/home/features/home_page.dart';
import 'package:kursol/features/home/main_page.dart';
import 'package:kursol/features/my_course/presentation/pages/completed_course_page.dart';
import 'package:kursol/features/profile/features/edit_profile/edit_profile_page.dart';
import 'package:kursol/features/profile/features/notification/profile_notification_page.dart';
import 'package:kursol/features/profile/profile_page.dart';
import 'package:kursol/features/transaction/pages/e_receipt_page.dart';
import 'package:kursol/features/transaction/pages/transactions_page.dart';
import '../../features/course_details/presentation/pages/course_details_page.dart';
import '../../features/course_details/presentation/pages/mentor_profile.dart';
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
  initialLocation: RoutePaths.forgotPassword,
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
          builder: (context, state) => HomePage(),
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
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EditProfilePage(),
            ),
            // * Notification
            GoRoute(
              path: RoutePaths.notification,
              name: RouteNames.notification,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfileNotificationPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RoutePaths.completedCourse,
      name: RouteNames.completedCourse,
      builder: (context, state) {
        final courseId = state.pathParameters['id'] ?? '';
        return CompletedCoursePage(courseId: courseId);
      },
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

    // fillYourProfile
    GoRoute(
      path: RoutePaths.fillYourProfile,
      name: RouteNames.fillYourProfile,
      builder: (context, state) {
        return FillProfilePage();
      },
    ),
    GoRoute(
      path: RoutePaths.createNewPin,
      name: RouteNames.createNewPin,
      builder: (context, state) {
        return CreateNewPin();
      },
    ),
    GoRoute(
      path: RoutePaths.fingerPrint,
      name: RouteNames.fingerPrint,
      builder: (context, state) {
        return Fingerprint();
      },
    ),
    // forgotPassword
    GoRoute(
      path: RoutePaths.forgotPassword,
      name: RouteNames.forgotPassword,
      builder: (context, state) {
        return ForgotPassword();
      },
    ),
    GoRoute(
      path: RoutePaths.sendCodeForgotPassword,
      name: RouteNames.sendCodeForgotPassword,
      builder: (context, state) {
        return SendCodeForgotPassword();
      },
    ),
    GoRoute(
      path: RoutePaths.createNewPassword,
      name: RouteNames.createNewPassword,
      builder: (context, state) {
        return CreateNewPassword();
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
