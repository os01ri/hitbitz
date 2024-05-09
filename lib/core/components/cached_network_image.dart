import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/config/app_colors.dart';

class NetworkImageWidget extends StatefulWidget {
  const NetworkImageWidget({
    required this.url,
    this.width,
    this.height,
    this.hash,
    this.color,
    this.fit = BoxFit.cover,
    this.border,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.cacheKey,
    this.imagePadding = AppPadding.smallImage,
    super.key,
    // this.isPush = false,
    // this.topRightCornerText,
    // this.topLeftCornerText,
    // this.mediaUrl,
    // this.controller,
    // this.bottomLeftCornerText,
  });

  final String? url;
  final String? hash;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final Border? border;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final String? cacheKey;
  final EdgeInsetsGeometry? imagePadding;
  // final bool isPush;
  // final StreamController<bool>? controller;
  // final String? topRightCornerText;
  // final String? topLeftCornerText;
  // final String? bottomLeftCornerText;
  // final int mediaType;
  // final String? mediaUrl;

  @override
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.url == null) return const SizedBox.shrink();
    return ExtendedImage.network(
      widget.url!,
      fit: widget.fit,
      headers: const {
        'Connection': 'Keep-Alive',
      },
      cache: true,
      border: Border.all(color: context.colorScheme.outline),
      borderRadius: BorderRadius.circular(AppDimensions.imgRad),
      width: widget.width,
      height: widget.height,
      timeLimit: const Duration(seconds: 10),
      cacheKey: widget.cacheKey,
      timeRetry: const Duration(seconds: 10),
      loadStateChanged: (ExtendedImageState state) =>
          switch (state.extendedImageLoadState) {
        LoadState.loading => Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              shape: widget.shape,
              border: widget.border,
              borderRadius: widget.borderRadius,
            ),
            child: ClipRRect(
              borderRadius: (widget.borderRadius != null)
                  ? widget.borderRadius!.resolve(Directionality.of(context)) -
                      BorderRadius.circular(2)
                  : widget.shape == BoxShape.circle
                      ? BorderRadius.circular(100)
                      : BorderRadius.circular(15 - 2),
              child: widget.hash != null
                  ? BlurHash(hash: widget.hash!)
                  : Shimmer.fromColors(
                      baseColor: context.colorScheme.primary,
                      highlightColor: AppColors.highlightColorShimmer,
                      child:
                          SizedBox(width: widget.width, height: widget.height),
                    ),
            ),
          ),
        LoadState.failed => GestureDetector(
            onTap: state.reLoadImage,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                shape: widget.shape,
                border: widget.border,
                borderRadius: widget.borderRadius,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: (widget.borderRadius != null)
                        ? widget.borderRadius!
                                .resolve(Directionality.of(context)) -
                            BorderRadius.circular(2)
                        : widget.shape == BoxShape.circle
                            ? BorderRadius.circular(100)
                            : BorderRadius.circular(15 - 2),
                    child: widget.hash != null
                        ? BlurHash(hash: widget.hash!)
                        : Shimmer.fromColors(
                            baseColor: context.colorScheme.primary,
                            highlightColor: AppColors.highlightColorShimmer,
                            child: SizedBox(
                                width: widget.width, height: widget.height),
                          ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.replay_circle_filled_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        LoadState.completed => GestureDetector(
            // onTap: widget.isPush ? () => openMedia(state) : null,
            child: Container(
              width: widget.width,
              height: widget.height,
              margin: widget.imagePadding,
              decoration: BoxDecoration(
                shape: widget.shape,
                border: widget.border,
                borderRadius: widget.borderRadius,
                image: DecorationImage(
                  image: state.imageProvider,
                  fit: widget.fit,
                ),
              ),
            ),
          ),
      },
    );
  }

  void openMedia(ExtendedImageState state) async {
    // openImage(state.imageProvider);
  }

  // void openImage(ImageProvider imageProvider) {
  //   Navigator.of(context).pushNamed(
  //     ImageViewScreen.routeName,
  //     arguments: ImageViewScreenParams(
  //       imageProvider: imageProvider,
  //       imageUrl: widget.url,
  //       bottomLeftCornerText: widget.bottomLeftCornerText,
  //       topLeftCornerText: widget.topLeftCornerText,
  //       topRightCornerText: widget.topRightCornerText,
  //     ),
  //   );
  // }
}
