import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_assets.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/tab_controller_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/router/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  late final List<OnboardingItem> _onboardings;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _onboardings = [
      const OnboardingItem(
        title: AppStrings.onBoarding1Title,
        description: AppStrings.onBoarding1Body,
        imagePath: AppAssets.onboarding1,
      ),
      const OnboardingItem(
        title: AppStrings.onBoarding2Title,
        description: AppStrings.onBoarding2Body,
        imagePath: AppAssets.onboarding2,
      ),
      const OnboardingItem(
        title: AppStrings.onBoarding3Title,
        description: AppStrings.onBoarding3Body,
        imagePath: AppAssets.onboarding3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageWidget(path: AppAssets.onboarding4).positionedDirectional(start: -100, top: context.height * .05),
          const ImageWidget(path: AppAssets.onboarding4).positionedDirectional(end: -100, top: context.height * .3),
          Column(
            children: [
              const Gap(40),
              PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: _onboardings,
              ).expand(flex: 4),
              SmoothPageIndicator(
                controller: _pageController,
                count: _onboardings.length,
                effect: WormEffect(
                  dotColor: context.colorScheme.outline,
                  activeDotColor: context.colorScheme.primary,
                ),
              ).expand(),
              Row(
                children: [
                  ButtonWidget(
                    onPressed: () => context.goNamed(AppRoutes.login),
                    text: AppStrings.skip,
                    isOutlined: false,
                    foregroundColor: context.colorScheme.onSurfaceVariant,
                  ).expand(),
                  const Gap(10),
                  ButtonWidget(
                    onPressed: () {
                      final index = _pageController.page!.ceil();
                      if (index == _onboardings.length - 1) {
                        context.goNamed(AppRoutes.login);
                        return;
                      }

                      _pageController.goTo(index + 1);
                    },
                    text: AppStrings.next,
                    isOutlined: false,
                    foregroundColor: context.colorScheme.onPrimary,
                    backgroundColor: context.colorScheme.primary,
                  ).expand(),
                ],
              ).wrapPadding(AppPadding.pagePaddingVertical),
              const Gap(40),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingItem({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageWidget(
          path: imagePath,
          height: context.height * .4,
        ),
        const Spacer(),
        TextWidget(
          title,
          maxLines: 20,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ),
        Gap(context.height * .05),
        TextWidget(
          description,
          maxLines: 20,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    ).wrapPadding(AppPadding.pagePaddingVertical);
  }
}
