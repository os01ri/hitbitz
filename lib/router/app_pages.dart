import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/features/auth/presentation/pages/login_page.dart';
import 'package:hitbitz/features/auth/presentation/pages/sign_up_page.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/main/presentation/pages/main_page.dart';
import 'package:hitbitz/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quiz_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/level_details_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/roadmap_details_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/roadmap_search_results_page.dart';
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
      _welcomingRoutes,
      _mainRoutes,
    ],
  );

  static final GoRoute _welcomingRoutes = GoRoute(
    path: AppRoutes.splash,
    name: AppRoutes.splash,
    builder: (context, state) => const SplashPage(),
    routes: [
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
    ],
  );

  static final GoRoute _mainRoutes = GoRoute(
    path: AppRoutes.main,
    name: AppRoutes.main,
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        name: AppRoutes.search,
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
        routes: const [],
      ),
      GoRoute(
        name: AppRoutes.roadmapSearchResults,
        path: AppRoutes.roadmapSearchResults,
        builder: (context, state) => const RoadmapSearchResultsPage(),
        routes: const [],
      ),
      GoRoute(
        name: AppRoutes.roadmapDetails,
        path: AppRoutes.roadmapDetails,
        builder: (context, state) => RoadmapDetailsPage(roadMap: state.extra as RoadMapModel),
        routes: [
          GoRoute(
            name: AppRoutes.levelDetails,
            path: AppRoutes.levelDetails,
            builder: (context, state) => LevelDetailsPage(levelId: state.extra as int),
            routes: [
              GoRoute(
                name: AppRoutes.quiz,
                path: AppRoutes.quiz,
                builder: (context, state) => const QuizPage(),
                routes: const [],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
