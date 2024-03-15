import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';

class LevelDetailsPage extends StatelessWidget {
  const LevelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withOpacity(.2),
        notificationPredicate: (notification) => false,
        title: const TextWidget('Fluter - Level 1'),
      ),
      body: ListView.separated(
        itemCount: 17,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) => CardWidget(
          color: index == 6 ? context.colorScheme.primary : context.colorScheme.primary.withOpacity(.3),
          child: ListTile(
            leading: CardWidget(
              isCircle: true,
              color: context.colorScheme.onPrimary,
              width: 22,
              height: 22,
              borderColor: context.colorScheme.primary,
              child: Icon(
                index == 6 ? FontAwesomeIcons.play : FontAwesomeIcons.check,
                color: context.colorScheme.primary,
              ),
            ),
            title: TextWidget(
              'Step ${index + 1}',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
