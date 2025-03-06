import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/utils/logger/app_logger.dart';
import 'package:kursol/features/home/features/bookmark/bookmark_page.dart';
import 'package:kursol/features/home/features/courses/popular_courses.dart';
import 'package:kursol/features/home/features/home_page.dart';
import 'package:kursol/features/home/features/mentors/mentors_page.dart';
import 'package:kursol/features/home/features/notification/notification_page.dart';
import 'package:kursol/features/home/features/search/search_page.dart';
import 'package:kursol/features/home/main_page.dart';
import 'package:kursol/features/my_course/presentation/pages/completed_course_page.dart';

import 'package:kursol/features/test/presentation/test_detail_page.dart';
import 'package:kursol/features/test/presentation/test_page.dart';
import 'package:kursol/features/test/presentation/test_result_page.dart';
import 'package:kursol/features/test/presentation/test_solving_page.dart';

import 'package:kursol/features/transaction/pages/e_receipt_page.dart';
import 'package:kursol/features/transaction/pages/transactions_page.dart';
import '../../features/auth/presentation/pages/auth_pages_export.dart';
import '../../features/auth/presentation/pages/forget_reset_password/pages/create_new_password.dart';
import '../../features/auth/presentation/pages/forget_reset_password/pages/forgot_password.dart';
import '../../features/auth/presentation/pages/forget_reset_password/pages/send_code_forgot_password.dart';
import '../../features/auth/presentation/pages/profile/pages/create_new_pin.dart';
import '../../features/auth/presentation/pages/profile/pages/fill_your_profile.dart';
import '../../features/auth/presentation/pages/profile/pages/finger_print.dart';
import '../../features/course_details/presentation/pages/course_details_page.dart';
import '../../features/course_details/presentation/pages/mentor_profile.dart';
import '../../features/my_course/presentation/pages/my_course_page.dart';
import '../../features/my_course/presentation/pages/ongoing_course_page.dart';
import '../../features/my_course/presentation/pages/video_player_page.dart';
import '../../features/profile/presentation/pages/profile_pages_export.dart';
import 'route_names.dart';
import 'route_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [MyNavigatorObserver()],
  initialLocation: RoutePaths.splash,
  routes: [
    // *  Splash
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    // * Onboarding
    GoRoute(
      path: RoutePaths.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    // * Auth
    GoRoute(
      path: RoutePaths.auth,
      name: RouteNames.auth,
      builder: (context, state) => const AuthPage(),
    ),
    // * SignUp
    GoRoute(
      path: RoutePaths.signup,
      name: RouteNames.signup,
      builder: (context, state) => const SignUpPage(),
    ),
    // * SignIn
    GoRoute(
      path: RoutePaths.signin,
      name: RouteNames.signin,
      builder: (context, state) => const SignInPage(),
    ),

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
            routes: <RouteBase>[
              // * Notification
              GoRoute(
                path: RoutePaths.homeNotification,
                name: RouteNames.homeNotification,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const NotificationPage(),
              ),
              // * Bookmark
              GoRoute(
                path: RoutePaths.homeBookmark,
                name: RouteNames.homeBookmark,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const BookmarkPage(),
              ),
              // * Mentors
              GoRoute(
                path: RoutePaths.homeMentors,
                name: RouteNames.homeMentors,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const MentorsPage(),
              ),
              // * Courses
              GoRoute(
                path: RoutePaths.homePopularCourses,
                name: RouteNames.homePopularCourses,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const PopularCourses(),
              ),
              // * Search
              GoRoute(
                path: RoutePaths.homeSearch,
                name: RouteNames.homeSearch,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const SearchPage(),
              ),
            ]),
        // * Inbox
        GoRoute(
          path: RoutePaths.test,
          name: RouteNames.test,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const TestPage(),
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
            ]),

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
      path: RoutePaths.testDetail,
      name: RouteNames.testDetail,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;
        final testTitle = args?['testTitle'] ?? 'Unknown Test';
        return TestDetailPage(testTitle: testTitle);
      },
    ),

    GoRoute(
      path: '/test-solving',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;
        final subject = args?['subject'] ?? 'Unknown Subject';
        return TestSolvingPage(subject: subject);
      },
    ),
    GoRoute(
      path: '/test-result',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>? ?? {};
        return TestResultPage(
          testTitle: args['testTitle'] ?? 'Test Results',
          testImage: args['testImage'] ?? '',
          correctAnswers: args['correctAnswers'] ?? 0,
          incorrectAnswers: args['incorrectAnswers'] ?? 0,
          unanswered: args['unanswered'] ?? 0,
        );
      },
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
