import 'package:flutter/material.dart';
import 'package:hitbitz/core/config/app_constants.dart';
import 'package:hitbitz/core/config/box_shadow.dart';

import '../config/app_dimensions.dart';
import '../config/app_padding.dart';
import '../extensions/context_extension.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.onTap,
    this.color,
    this.child,
    this.borderRadius,
    this.isOutlined = false,
    this.isShadowed = false,
    this.backgroundImagePath,
    this.borderColor,
    this.padding = AppPadding.zero,
    this.margin,
    this.width,
    this.height,
    this.isCircle = false,
    this.foregroundColor,
    this.contentAlignment = AlignmentDirectional.center,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color? color;
  final Color? foregroundColor;
  final Color? borderColor;
  final String? backgroundImagePath;
  final Widget? child;
  final double? borderRadius;
  final bool isOutlined;
  final bool isShadowed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final bool isCircle;
  final AlignmentGeometry contentAlignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConstants.animationDurationX1,
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: color ?? context.colorScheme.background,
        shape: isCircle
            ? CircleBorder(
                side: BorderSide(
                  width: 1,
                  color: isOutlined ? (borderColor ?? context.colorScheme.outline) : Colors.transparent,
                ),
              )
            : ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? AppDimensions.cardRad),
                side: BorderSide(
                  width: 1,
                  color: isOutlined ? (borderColor ?? context.colorScheme.outline) : Colors.transparent,
                ),
              ),
        image:
            backgroundImagePath != null ? DecorationImage(image: AssetImage(backgroundImagePath!), fit: BoxFit.cover) : null,
        shadows: [if (isShadowed) customBoxShadow],
      ),
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          alignment: contentAlignment,
          foregroundColor: MaterialStatePropertyAll(foregroundColor ?? context.colorScheme.onSurfaceVariant),
          padding: const MaterialStatePropertyAll(AppPadding.zero),
          shape: MaterialStatePropertyAll(
            isCircle
                ? const CircleBorder()
                : ContinuousRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? AppDimensions.cardRad)),
          ),
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
