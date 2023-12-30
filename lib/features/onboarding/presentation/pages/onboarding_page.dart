import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/auth/presentation/widgets/raneems_button.dart';
import 'package:hitbitz/router/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();

  final List<String> _captions = [
    'Create, share and play quizzes whenever and wherever You want',
    'Find fun and interesting quizzes to boost up your knowledge',
    'Play and take quiz challenges together with your friends.',
  ];
  final List<String> _images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  List<Widget> _generateImages() {
    return _images
        .mapIndexed(
          (index, element) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(element),
              const Gap(20),
              Text(
                _captions[index],
                maxLines: 20,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(60),
          PageView(
            controller: _pageController,
            children: _generateImages(),
          ).expand(),
          SmoothPageIndicator(
            controller: _pageController,
            count: _images.length,
            effect: const WormEffect(),
          ),
          const Gap(20),
          RaneemsButton(
            text: "GET STARTED",
            color: const Color(0xff6949FF),
            textColor: Colors.white,
            onPressed: () {
              context.goNamed(AppRoutes.signup);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return const SignUpPage();
              // }));
            },
          ),
          const Gap(20),
          RaneemsButton(
            text: "I ALREADY HAVE AN ACCOUNT",
            color: const Color(0xffF0EDFF),
            textColor: const Color(0xff8065FF),
            onPressed: () {
              context.goNamed(AppRoutes.login);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return const LoginPage();
              // }));
            },
          ),
          const Gap(50),
        ],
      ).wrapPadding(AppPadding.pagePadding),
    );
  }
}
