import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/features/auth/presentation/pages/login_page.dart';
import 'package:hitbitz/features/auth/presentation/pages/sign_up_page.dart';
import 'package:hitbitz/features/challenge/presentation/pages/challenges_page.dart';
import 'package:hitbitz/features/cv/presentation/pages/send_cv_screen.dart';
import 'package:hitbitz/features/friends/presentation/pages/friend_requests_page.dart';
import 'package:hitbitz/features/friends/presentation/pages/friends_page.dart';
import 'package:hitbitz/features/friends/presentation/pages/profile_page.dart';
import 'package:hitbitz/features/main/presentation/pages/main_page.dart';
import 'package:hitbitz/features/notification/presentation/pages/notifications_page.dart';
import 'package:hitbitz/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hitbitz/features/profile/presentation/pages/update_profile_page.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quiz_intro_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quiz_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quizzes_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/result_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/review_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/roadmap_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/steps_page.dart';
import 'package:hitbitz/features/search/presentation/pages/search_page.dart';
import 'package:hitbitz/features/splash/presentation/pages/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  const AppPages._();

  static GoRouter get router => _router;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  static final _router = GoRouter(
    initialLocation: AppRoutes.splash,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      ..._welcomingRoutes,
      _mainRoutes,
    ],
  );

  static final List<GoRoute> _welcomingRoutes = [
    GoRoute(
      name: AppRoutes.onBoarding,
      path: AppRoutes.onBoarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: AppRoutes.signup,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: AppRoutes.sendCv,
      path: AppRoutes.sendCv,
      builder: (context, state) => const SendCvScreen(),
    ),
  ];

  static final GoRoute _mainRoutes = GoRoute(
    path: AppRoutes.main,
    name: AppRoutes.main,
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        name: AppRoutes.updateProfile,
        path: AppRoutes.updateProfile,
        builder: (context, state) => UpdateProfilePage(args: state.extra as UpdateProfileArgs),
        routes: const [],
      ),
      GoRoute(
        name: AppRoutes.challenges,
        path: AppRoutes.challenges,
        builder: (context, state) => ChallengesPage(currentUserIdl: state.extra as int),
        routes: const [],
      ),
      GoRoute(
        name: AppRoutes.notifications,
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsPage(),
        routes: const [],
      ),
      GoRoute(
        name: AppRoutes.search,
        path: AppRoutes.search,
        builder: (context, state) => SearchPage(query: state.extra as String),
        routes: const [],
      ),
      GoRoute(
        name: AppRoutes.profile,
        path: AppRoutes.profile,
        builder: (context, state) => ProfilePage(id: state.extra as int),
        routes: [
          GoRoute(
            name: AppRoutes.friendRequests,
            path: AppRoutes.friendRequests,
            builder: (context, state) => const FriendRequestsPage(),
          ),
          GoRoute(
            name: AppRoutes.friends,
            path: AppRoutes.friends,
            builder: (context, state) => const FriendsPage(),
          ),
        ],
      ),
      // GoRoute(
      //   name: AppRoutes.roadmapSearchResults,
      //   path: AppRoutes.roadmapSearchResults,
      //   builder: (context, state) => const RoadmapSearchResultsPage(),
      //   routes: const [],
      // ),
      GoRoute(
        name: AppRoutes.roadmap,
        path: AppRoutes.roadmap,
        builder: (context, state) => RoadmapPage(args: state.extra as RoadMapPageArguments),
        routes: [
          GoRoute(
            name: AppRoutes.steps,
            path: AppRoutes.steps,
            builder: (context, state) => StepsPage(args: state.extra as StepsPageArguments),
            routes: [
              GoRoute(
                name: AppRoutes.quizzes,
                path: AppRoutes.quizzes,
                builder: (context, state) => QuizzesPage(stepId: state.extra as int),
                routes: [
                  GoRoute(
                    name: AppRoutes.quizIntro,
                    path: AppRoutes.quizIntro,
                    builder: (context, state) => QuizIntroPage(args: state.extra as QuizIntroPageArguments),
                    routes: [
                      GoRoute(
                        name: AppRoutes.quiz,
                        path: AppRoutes.quiz,
                        builder: (context, state) => QuizPage(args: state.extra as QuizPageArgs),
                        routes: const [],
                      ),
                      GoRoute(
                        name: AppRoutes.quizResult,
                        path: AppRoutes.quizResult,
                        builder: (context, state) => ResultPage(args: state.extra as ResultPageArgs),
                      ),
                      GoRoute(
                        name: AppRoutes.quizReview,
                        path: AppRoutes.quizReview,
                        builder: (context, state) => ReviewPage(quiz: state.extra as QuizModel),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
