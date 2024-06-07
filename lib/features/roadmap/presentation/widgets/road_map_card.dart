import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/cached_network_image.dart';
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
      onTap: () => context.pushNamed(AppRoutes.roadmapDetails, extra: roadMap),
      width: context.width * .4,
      borderRadius: AppDimensions.mediumBorderRadius,
      borderColor: context.colorScheme.outline,
      isOutlined: true,
      color: context.colorScheme.surface,
      padding: AppPadding.innerCardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (roadMap.media?.mediaUrl != null)
            NetworkImageWidget(
              url: roadMap.media!.mediaUrl!,
              hash: roadMap.media!.hash,
              height: 80,
              width: 80,
            )
          else
            const SizedBox(height: 80),
          const Gap(5),
          TextWidget(
            roadMap.name,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
            maxLines: 2,
          ),
          const Spacer(),
          const Gap(5),
          Row(
            children: [
              CardWidget(
                height: AppDimensions.smallButtonHeight,
                color: context.colorScheme.surfaceContainerHighest,
                foregroundColor: context.colorScheme.onSurfaceVariant,
                child: const TextWidget('12 Levels').fit(BoxFit.scaleDown),
              ).expand(),
              const Gap(8),
              CardWidget(
                height: AppDimensions.smallButtonHeight,
                color: context.colorScheme.surfaceContainerHighest,
                foregroundColor: context.colorScheme.onSurfaceVariant,
                child: const TextWidget('37 Steps').fit(BoxFit.scaleDown),
              ).expand(),
            ],
          ),
          const Gap(8),
          ButtonWidget(
            // onPressed:
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
