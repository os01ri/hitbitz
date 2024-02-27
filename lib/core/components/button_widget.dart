import 'package:flutter/material.dart';
import 'package:hitbitz/core/config/app_constants.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';

import '../config/app_colors.dart';
import '../extensions/widget_extensions.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.radius,
    this.isOutlined = false,
    this.isExpandedText = false,
    this.isElevated = false,
    this.borderColor,
    this.width,
    this.height,
    this.padding,
    this.spaceBetween,
    this.textDirection,
    this.textStyle,
    this.borderThickness = 1,
  })  : assert(prefixIcon != null || text != null),
        super(key: key);

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final String? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final double? spaceBetween;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool isOutlined;
  final bool isExpandedText;
  final bool isElevated;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final double borderThickness;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConstants.animationDurationX2,
      padding: padding ?? EdgeInsets.zero,
      height: height ?? AppDimensions.buttonHeight,
      width: getFixedSize?.width,
      decoration: ShapeDecoration(
        color: isOutlined ? (backgroundColor ?? Colors.transparent) : (backgroundColor ?? AppColors.surfaceContainer(context)),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRad),
          side: BorderSide(
            color: isOutlined ? (borderColor ?? Theme.of(context).colorScheme.outline) : Colors.transparent,
            width: borderThickness,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          if (spaceBetween != null && text != null && prefixIcon != null) SizedBox(width: spaceBetween),
          if (text != null)
            TextWidget(
              text,
              textDirection: textDirection,
              style: (textStyle ?? context.textTheme.bodyMedium)?.copyWith(color: foregroundColor),
            ).expand(flex: isExpandedText ? 1 : 0),
          if (spaceBetween != null && text != null && suffixIcon != null) SizedBox(width: spaceBetween),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    ).onTap(onPressed);
  }

  Size? get getFixedSize {
    if (width == null && height == null) {
      return null;
    } else if (width != null && height == null) {
      return Size.fromWidth(width!);
    } else if (width == null && height != null) {
      return Size.fromHeight(height!);
    } else {
      return Size(width!, height!);
    }
  }
}
