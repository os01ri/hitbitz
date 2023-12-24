import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/features/auth/presentation/widgets/raneems_button.dart';
import 'package:hitbitz/router/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<String> _captions = [
    'Create, share and play \nquizzes whenever and \n  wherever You want',
    'Find fun and interesting \nquizzes to boost up your \n            knowledge',
    '      Play and take quiz \nchallenges together with \n         your friends.',
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
            children: [
              Image.asset(element),
              const Spacer(),
              Text(
                _captions[index],
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
          Expanded(
            child: CarouselSlider(
              items: _generateImages(),
              options: CarouselOptions(aspectRatio: 1),
            ),
          ),
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
      ),
    );
  }
}
