import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/utils/logger/app_logger.dart';
import 'package:kursol/features/home/features/home_page.dart';
import 'package:kursol/features/home/main_page.dart';
import 'package:kursol/features/my_course/presentation/pages/completed_course_page.dart';
import 'package:kursol/features/profile/features/edit_profile/edit_profile_page.dart';
import 'package:kursol/features/profile/features/help_center/profile_help_center_page.dart';
import 'package:kursol/features/profile/features/invite_friends/profile_invite_friends_page.dart';
import 'package:kursol/features/profile/features/language/profile_language_page.dart';
import 'package:kursol/features/profile/features/notification/profile_notification_page.dart';
import 'package:kursol/features/profile/features/payment/payment_add_new_card_page.dart';
import 'package:kursol/features/profile/features/payment/profile_payment_page.dart';
import 'package:kursol/features/profile/features/privacy_policy/profile_policy_page.dart';
import 'package:kursol/features/profile/features/security/profile_security_page.dart';
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
          routes: <RouteBase>[
            GoRoute(
              path: RoutePaths.eReceipt,
              name: RouteNames.eReceipt,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EReceiptPage(),
            ),
          ]
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
            // * Profile Payment
            GoRoute(
              path: RoutePaths.profilePayment,
              name: RouteNames.profilePayment,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfilePaymentPage(),
              routes: <RouteBase>[
                // * Payment Add New Card
                GoRoute(
                  path: RoutePaths.paymentAddNewCard,
                  name: RouteNames.paymentAddNewCard,
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const PaymentAddNewCardPage(),
                ),
              ],
            ),
            // * Security
            GoRoute(
              path: RoutePaths.profileSecurity,
              name: RouteNames.profileSecurity,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfileSecurityPage(),
            ),
            // * Language
            GoRoute(
              path: RoutePaths.profileLanguage,
              name: RouteNames.profileLanguage,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfileLanguagePage(),
            ),
            // * Privacy Policy
            GoRoute(
              path: RoutePaths.profilePrivacy,
              name: RouteNames.profilePrivacy,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfilePrivacyPage(),
            ),
            // * Help Center
            GoRoute(
              path: RoutePaths.profileHelpCenter,
              name: RouteNames.profileHelpCenter,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfileHelpCenterPage(),
            ),
            // * Invite Friends
            GoRoute(
              path: RoutePaths.profileInviteFriends,
              name: RouteNames.profileInviteFriends,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ProfileInviteFriendsPage(),
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
