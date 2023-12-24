import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/num_extension.dart';
import 'package:hitbitz/core/theme/text_theme.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.listenableValue,
    // required this.value,
    this.items,
    this.onChanged,
    this.label,
    this.hint,
  });

  // final T? value;
  final ValueNotifier<T?> listenableValue;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          TextWidget(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppDimensions.verySmallSizedBox.hs,
        ],
        Container(
          height: AppDimensions.buttonHeight,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.5,
              color: context.colorScheme.outline,
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: listenableValue,
            builder: (context, value, _) {
              return DropdownButton<T?>(
                value: value,
                hint: TextWidget(
                  hint ?? 'اختر',
                  style: textTheme.bodyMedium?.copyWith(fontFamily: 'Cairo'),
                ),
                style: textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Cairo',
                ),
                borderRadius: BorderRadius.circular(8),
                // focusColor: AppColors.surfaceContainerLow(context),
                underline: const SizedBox.shrink(),
                items: items,
                onChanged: (value) {
                  listenableValue.value = value;
                  onChanged?.call(value);
                },
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                padding: AppPadding.buttonPadding,
                isDense: true,
                // dropdownColor: AppColors.surfaceContainerLow(context),
              );
            },
          ),
        ),
      ],
    );
  }
}
