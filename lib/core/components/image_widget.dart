import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.path,
    this.tag,
    this.fit = BoxFit.contain,
    this.keepOriginalColor,
    this.color,
    this.backgroundColor,
    this.width,
    this.height,
    this.border,
    this.alignment = Alignment.center,
    this.isCircle = false,
    this.isProfile = false,
    this.margin,
    this.topWidget,
    this.radius = 0,
  }) : super(key: key);

  final Widget? topWidget;
  final String path;
  final dynamic tag;
  final Color? color;
  final Color? backgroundColor;
  final bool? keepOriginalColor;
  final BoxFit fit;
  final double? width;
  final double? height;
  final bool isCircle;
  final double radius;
  final Border? border;
  final bool isProfile;
  final Alignment alignment;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (path.contains("http")) {
      if (path.split(".").last == "svg") {
        child = SvgPicture.network(path, color: color, width: width, height: height, fit: fit, alignment: alignment);
      } else {
        child = CachedNetworkImage(
          imageUrl: path,
          fit: fit,
          height: height,
          width: width,
          color: color,
          alignment: alignment,
          placeholder: (_, __) {
            return LayoutBuilder(builder: (context, c) {
              return SizedBox(width: width, height: height);
            });
          },
          errorWidget: (_, __, ___) => const SizedBox.shrink(),
        );
      }
    } else if (path.startsWith("/data")) {
      if (path.split(".").last == "svg") {
        child = SvgPicture.file(File(path), color: color, width: width, height: height, fit: fit, alignment: alignment);
      } else {
        child = Image.file(File(path), color: color, width: width, height: height, fit: fit, alignment: alignment);
      }
    } else {
      if (path.split(".").last == "svg") {
        child = SvgPicture.asset(path, color: color, width: width, height: height, fit: fit, alignment: alignment);
      } else {
        child = Image.asset(path, color: color, width: width, height: height, fit: fit, alignment: alignment);
      }
    }
    return AnimatedContainer(
      duration: AppConstants.animationDurationFast,
      alignment: Alignment.center,
      margin: margin,
      // duration: AppConstants.animationDurationFast,
      width: width,
      height: height,
      foregroundDecoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          border: border,
          borderRadius: isCircle ? null : BorderRadius.all(Radius.circular(radius)),
          color: Colors.transparent),
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: border,
        borderRadius: isCircle ? null : BorderRadius.all(Radius.circular(radius)),
        color: backgroundColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          topWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
