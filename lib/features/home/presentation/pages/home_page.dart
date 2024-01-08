import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/router/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          const _SearchCard().wrapPadding(AppPadding.pagePaddingHorizontal),
          const Gap(10),
          const _SectionTitle(text: 'Where You Left').wrapPadding(AppPadding.pagePaddingHorizontal),
          const Gap(10),
          const _RecentRoadmapCard().wrapPadding(AppPadding.pagePaddingHorizontal),
          const Gap(10),
          const _SectionTitle(text: 'Categories').wrapPadding(AppPadding.pagePaddingHorizontal),
          const Gap(10),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: AppPadding.pagePaddingHorizontal,
              children: [
                for (int i = 0; i < 10; i++) ...[const CategoryCard(), const Gap(10)],
              ],
            ),
          ),
          const _SectionTitle(text: 'Roadmaps').wrapPadding(AppPadding.pagePaddingHorizontal),
          const Gap(10),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: AppPadding.pagePaddingHorizontal,
              children: [
                for (int i = 0; i < 10; i++) ...[
                  CardWidget(
                    width: context.width * .4,
                    borderRadius: AppDimensions.mediumBorderRadius,
                    borderColor: context.colorScheme.outline,
                    isOutlined: true,
                    color: context.colorScheme.surface,
                    padding: AppPadding.innerCardPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.figma,
                          color: Colors.red,
                          size: 50,
                        ),
                        const Gap(5),
                        TextWidget(
                          'Mastering UI/UX Design',
                          textColor: context.colorScheme.onSurface,
                          maxLines: 4,
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            CardWidget(
                              height: AppDimensions.smallButtonHeight,
                              color: context.colorScheme.surfaceVariant,
                              foregroundColor: context.colorScheme.onSurfaceVariant,
                              child: const TextWidget('12 Levels'),
                            ).expand(),
                            const Gap(8),
                            CardWidget(
                              height: AppDimensions.smallButtonHeight,
                              color: context.colorScheme.surfaceVariant,
                              foregroundColor: context.colorScheme.onSurfaceVariant,
                              child: const TextWidget('37 Steps'),
                            ).expand(),
                          ],
                        ),
                        const Gap(8),
                        ButtonWidget(
                          onPressed: () => context.pushNamed(AppRoutes.roadmapDetails),
                          text: 'Start Journey',
                          backgroundColor: context.colorScheme.primary,
                          foregroundColor: context.colorScheme.onPrimary,
                          width: context.width,
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(
          color: context.colorScheme.primaryContainer,
          width: 80,
          height: 80,
          child: FaIcon(
            FontAwesomeIcons.penNib,
            color: context.colorScheme.primary,
          ),
        ),
        const Gap(5),
        const TextWidget('Design'),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text,
      style: context.textTheme.titleMedium?.copyWith(
        color: context.colorScheme.onBackground,
      ),
    );
  }
}

class _RecentRoadmapCard extends StatelessWidget {
  const _RecentRoadmapCard();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.mediumBorderRadius,
        ),
      ),
      tileColor: Colors.blueAccent,
      contentPadding: AppPadding.def,
      leading: const CardWidget(
        borderRadius: AppDimensions.mediumBorderRadius,
        child: Icon(
          Icons.flutter_dash_outlined,
          size: 40,
          color: Colors.blueAccent,
        ),
      ),
      title: TextWidget(
        "Flutter - Mobile App Development",
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      trailing: Stack(
        alignment: Alignment.center,
        children: [
          TextWidget(
            '60%',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          CircularProgressIndicator(
            backgroundColor: context.colorScheme.onPrimary,
            color: context.colorScheme.primary,
            value: .6,
            strokeWidth: 7,
          ),
        ],
      ),
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      borderRadius: AppDimensions.mediumBorderRadius,
      padding: AppPadding.innerCardPadding,
      color: context.colorScheme.primary,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.book,
                color: context.colorScheme.onPrimary,
              ),
              const Gap(10),
              TextWidget(
                'HitBitz',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const Gap(20),
          TextWidget(
            'Hello, Osama!',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap(2),
          TextWidget(
            'Find the roadmap or field you like here',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap(20),
          TextFieldWidget(
            controller: TextEditingController(),
            borderColor: context.colorScheme.onPrimary,
            prefixIcon: const FaIcon(FontAwesomeIcons.magnifyingGlass).paddingAll(12),
            hint: 'search',
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
