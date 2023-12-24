import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/extensions/num_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

import '../config/app_strings.dart';
import '../theme/text_theme.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // SvgPicture.asset(SvgPath.noData),
        const SizedBox(height: 16),
        TextWidget(
          AppStrings.noData,
          style: textTheme.bodyLarge,
        ),
        AppDimensions.smallSizedBox.hs,
        if (onTap != null) const Icon(Icons.refresh_rounded)
      ],
    ).onTap(onTap);
  }
}
