import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/features/auth/presentation/pages/login_page.dart';
import 'package:hitbitz/features/auth/presentation/pages/sign_up_page.dart';
import 'package:hitbitz/features/home/presentation/pages/home_page.dart';
import 'package:hitbitz/features/onboarding/presentation/pages/onboarding_page.dart';
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
      _authRoutes,
      _homeRoutes,
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
    ],
  );

  static final GoRoute _authRoutes = GoRoute(
    path: AppRoutes.signup,
    name: AppRoutes.signup,
    builder: (context, state) => const SignUpPage(),
    routes: [
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );

  static final GoRoute _homeRoutes = GoRoute(
    path: AppRoutes.main,
    name: AppRoutes.main,
    builder: (context, state) => const HomePage(),
  );
}
