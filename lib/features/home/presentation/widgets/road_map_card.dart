import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/router/app_routes.dart';

class RoadMapCard extends StatelessWidget {
  const RoadMapCard({
    super.key,
    required this.roadMap,
  });

  final RoadMapModel roadMap;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
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
            roadMap.name, // 'Mastering UI/UX Design',
            textColor: context.colorScheme.onSurface,
            maxLines: 4,
          ),
          const Spacer(),
          Row(
            children: [
              CardWidget(
                height: AppDimensions.smallButtonHeight,
                color: context.colorScheme.surfaceVariant,
                foregroundColor: context.colorScheme.onSurfaceVariant,
                child: const TextWidget('12 Levels').fit(BoxFit.scaleDown),
              ).expand(),
              const Gap(8),
              CardWidget(
                height: AppDimensions.smallButtonHeight,
                color: context.colorScheme.surfaceVariant,
                foregroundColor: context.colorScheme.onSurfaceVariant,
                child: const TextWidget('37 Steps').fit(BoxFit.scaleDown),
              ).expand(),
            ],
          ),
          const Gap(8),
          ButtonWidget(
            onPressed: () => context.pushNamed(AppRoutes.roadmapDetails, extra: roadMap),
            text: 'Start Journey',
            backgroundColor: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onPrimary,
            width: context.width,
          ),
        ],
      ),
    );
  }
}
