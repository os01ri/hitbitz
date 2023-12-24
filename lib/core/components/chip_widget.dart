import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/num_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/theme/text_theme.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.title,
    this.hasRemoveIcon = false,
    this.onRemove,
  });

  final String title;
  final VoidCallback? onRemove;
  final bool hasRemoveIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: AppPadding.choiceChipPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            title,
            style: textTheme.bodyMedium?.copyWith(color: context.colorScheme.onTertiaryContainer),
          ),
          if (hasRemoveIcon) ...[
            AppDimensions.smallSizedBox.ws,
            Icon(Icons.close_rounded, size: 20, color: context.colorScheme.onSurface).onTap(onRemove),
          ],
        ],
      ),
    );
  }
}
