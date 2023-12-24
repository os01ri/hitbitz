import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../extensions/widget_extensions.dart';

class SkeltonLoading extends StatelessWidget {
  const SkeltonLoading({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.padding = 0,
    this.margin,
    this.child,
    this.baseColor,
    this.highlightColor,
    this.isLoading = true,
  }) : assert((width != null && height != null) || child != null);

  final double? height;
  final double? width;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Widget? child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Shimmer.fromColors(
            baseColor: baseColor ?? const Color(0xffcbcbcb).withOpacity(0.4),
            highlightColor: highlightColor ?? const Color(0xffcbcbcb).withOpacity(0.6),
            child: child ??
                CardWidget(
                  margin: margin,
                  width: width,
                  height: height,
                  color: Colors.white,
                  borderRadius: borderRadius ?? 24,
                ),
          ).paddingVertical(padding)
        : child ?? const SizedBox.shrink();
  }
}
