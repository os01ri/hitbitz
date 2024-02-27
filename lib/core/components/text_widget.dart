import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final List<TextWidget>? children;
  final Function()? onTap;
  final bool? isUnderlineShown;
  final bool? isInlineShown;
  final int? maxLines;
  final double? height;
  final TextDirection? textDirection;
  final String? fontFamily;
  final MouseCursor? cursor;
  final TextOverflow? overflow;
  final TextStyle? style;

  const TextWidget(
    this.text, {
    super.key,
    this.textColor,
    this.overflow,
    this.fontSize,
    this.cursor,
    this.fontWeight,
    this.textAlign,
    this.style,
    this.children,
    this.isUnderlineShown,
    this.isInlineShown,
    this.onTap,
    this.maxLines,
    this.textDirection,
    this.height,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: (text ?? '').tr(),
          mouseCursor: cursor ?? (onTap == null ? SystemMouseCursors.basic : null),
          children: (children ?? [])
              .map((e) => TextSpan(
                  text: (e.text ?? '').tr(),
                  mouseCursor: e.cursor ?? (e.onTap == null ? SystemMouseCursors.basic : null),
                  style: e.style ??
                      TextStyle(
                        color: e.textColor,
                        overflow: e.overflow,
                        fontSize: e.fontSize,
                        fontWeight: e.fontWeight,
                        fontFamily: e.fontFamily,
                        decoration: (e.isUnderlineShown ?? false)
                            ? TextDecoration.underline
                            : (e.isInlineShown ?? false)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                  recognizer: TapGestureRecognizer()..onTap = e.onTap))
              .toList(),
          recognizer: TapGestureRecognizer()..onTap = onTap),
      textDirection: textDirection,
      key: key,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            color: textColor,
            overflow: overflow,
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: (isUnderlineShown ?? false)
                ? TextDecoration.underline
                : (isInlineShown ?? false)
                    ? TextDecoration.lineThrough
                    : null,
          ),
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}
