import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppPadding.listViewPadding,
      itemCount: 30,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) => CardWidget(
        isShadowed: true,
        child: ListTile(
          leading: Icon(
            FontAwesomeIcons.solidBell,
            color: index <= 1 ? context.colorScheme.primary : null,
          ),
          title: const TextWidget('this is a test notification'),
          subtitle: TextWidget(DateTime.now().formatDate()),
        ),
      ),
    );
  }
}
