import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

class RoadmapDetailsPage extends StatelessWidget {
  const RoadmapDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withOpacity(.2),
        title: const TextWidget('Roadmap Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_add_outlined, color: context.colorScheme.onBackground),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.blueAccent.withOpacity(.2),
            width: context.width,
            height: context.height * .3,
            child: const Icon(
              Icons.flutter_dash_outlined,
              color: Colors.blueAccent,
              size: 150,
            ),
          ).positioned(top: 0),
          Container(
            height: context.height * .65,
            width: context.width,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.mediumBorderRadius),
                topRight: Radius.circular(AppDimensions.mediumBorderRadius),
              ),
            ),
            padding: AppPadding.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextWidget(
                  'Flutter - Mobile App Development',
                  maxLines: 3,
                  style: context.textTheme.headlineSmall,
                ),
                const Gap(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.userGroup, size: 16),
                        Gap(3),
                        TextWidget('1.2 K'),
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.clock, size: 16),
                        Gap(3),
                        TextWidget('56 h'),
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.star, size: 16),
                        Gap(3),
                        TextWidget('4.7'),
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                const TextWidget(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                  maxLines: 50,
                ),
                const Gap(20),
                TextWidget(
                  'Levels',
                  style: context.textTheme.titleLarge,
                ),
                const Gap(10),
                CardWidget(
                  isOutlined: true,
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    childrenPadding: AppPadding.innerCardPadding,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    leading: const FaIcon(FontAwesomeIcons.lockOpen, color: Colors.green),
                    title: const TextWidget('Beginner'),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.userGroup, size: 16),
                            Gap(3),
                            TextWidget('1.2 K'),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            Gap(3),
                            TextWidget('56 h'),
                          ],
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                    children: [
                      const TextWidget(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                        maxLines: 50,
                      ),
                      const Gap(10),
                      TextWidget(
                        'Requirements',
                        style: context.textTheme.titleMedium,
                      ),
                      const Gap(10),
                      for (int i = 0; i < 3; i++)
                        const ListTile(
                          title: TextWidget(
                            'Knowledge of programming fundamentals',
                            maxLines: 10,
                          ),
                          trailing: Icon(Icons.check, color: Colors.green),
                        ),
                      const Gap(10),
                      ButtonWidget(
                        onPressed: () {},
                        width: context.width,
                        backgroundColor: context.colorScheme.primary,
                        foregroundColor: context.colorScheme.onPrimary,
                        text: 'Start',
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                CardWidget(
                  isOutlined: true,
                  child: ExpansionTile(
                    childrenPadding: AppPadding.innerCardPadding,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    leading: const FaIcon(FontAwesomeIcons.lock, color: Colors.red),
                    title: const TextWidget('Med'),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.userGroup, size: 16),
                            Gap(3),
                            TextWidget('1.2 K'),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            Gap(3),
                            TextWidget('56 h'),
                          ],
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                    children: [
                      const TextWidget(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                        maxLines: 50,
                      ),
                      const Gap(10),
                      TextWidget(
                        'Requirements',
                        style: context.textTheme.titleMedium,
                      ),
                      const Gap(10),
                      for (int i = 0; i < 3; i++)
                        ListTile(
                          title: const TextWidget(
                            'Knowledge of programming fundamentals',
                            maxLines: 10,
                          ),
                          trailing: i == 0
                              ? const Icon(Icons.check, color: Colors.green)
                              : const Icon(Icons.close, color: Colors.red),
                        ),
                    ],
                  ),
                ),
                const Gap(10),
                CardWidget(
                  isOutlined: true,
                  child: ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: AppPadding.innerCardPadding,
                    leading: const FaIcon(FontAwesomeIcons.lock, color: Colors.red),
                    title: const TextWidget('Advanced'),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.userGroup, size: 16),
                            Gap(3),
                            TextWidget('1.2 K'),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            Gap(3),
                            TextWidget('56 h'),
                          ],
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                    children: [
                      const TextWidget(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                        maxLines: 50,
                      ),
                      const Gap(10),
                      TextWidget(
                        'Requirements',
                        style: context.textTheme.titleMedium,
                      ),
                      const Gap(10),
                      for (int i = 0; i < 3; i++)
                        ListTile(
                          title: const TextWidget(
                            'Knowledge of programming fundamentals',
                            maxLines: 10,
                          ),
                          trailing: i == 0
                              ? const Icon(Icons.check, color: Colors.green)
                              : const Icon(Icons.close, color: Colors.red),
                        ),
                    ],
                  ),
                ),
              ],
            ).scrollable(),
          ).positioned(bottom: 0),
        ],
      ),
    );
  }
}
