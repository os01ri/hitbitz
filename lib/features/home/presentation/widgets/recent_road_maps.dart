import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';

class RecentRoadmapCard extends StatelessWidget {
  const RecentRoadmapCard({super.key});

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
        'Flutter - Mobile App Development',
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
