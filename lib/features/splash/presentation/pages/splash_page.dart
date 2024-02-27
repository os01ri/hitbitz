import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/services/shared_preferences_service.dart';
import 'package:hitbitz/router/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      if (SharedPreferencesService.isAuth()) {
        context.goNamed(AppRoutes.main);
      } else {
        context.goNamed(AppRoutes.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
    );
  }
}
