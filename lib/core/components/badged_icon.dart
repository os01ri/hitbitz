import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/theme/text_theme.dart';

class BadgedIcon extends StatelessWidget {
  const BadgedIcon({
    super.key,
    required this.icon,
    required this.badgeCount,
    this.badgeColor,
    this.counterColor,
    this.onTap,
  });

  final Widget icon;
  final String badgeCount;
  final Color? badgeColor;
  final Color? counterColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CardWidget(
            isOutlined: true,
            isCircle: true,
            color: context.colorScheme.surface,
            child: icon,
          ).wrapPadding(AppPadding.appBarLeadingPadding),
          SizedBox.square(
            dimension: 24,
            child: Container(
              padding: AppPadding.tiny,
              decoration: ShapeDecoration(color: context.colorScheme.background, shape: const CircleBorder()),
              child: Container(
                decoration: ShapeDecoration(
                  color: badgeColor ?? context.colorScheme.primary,
                  shape: const CircleBorder(),
                ),
                padding: AppPadding.tiny,
                child: FittedBox(
                  child: TextWidget(
                    badgeCount,
                    style: textTheme.titleLarge?.copyWith(color: counterColor ?? context.colorScheme.onPrimary),
                  ).center(),
                ),
              ),
            ),
          ).positionedDirectional(end: 0),
        ],
      ),
    );
  }
}
