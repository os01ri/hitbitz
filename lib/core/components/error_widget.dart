import 'package:flutter/material.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

import '../config/app_strings.dart';
import '../extensions/context_extension.dart';
import '../theme/text_theme.dart';
import 'button_widget.dart';
import 'text_widget.dart';

class ErrorButtonWidget extends StatelessWidget {
  const ErrorButtonWidget({
    Key? key,
    required this.onTap,
    this.color,
    this.textColor,
    this.errorMessage,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   SvgPath.networkError,
          //   width: size.width * .25,
          // ),
          SizedBox(height: context.width * .02),
          TextWidget(
            AppStrings.error,
            style: textTheme.bodyLarge,
          ),
          SizedBox(height: context.width * .02),
          if (errorMessage != null)
            TextWidget(
              errorMessage,
              style: textTheme.bodyLarge,
            ),
          SizedBox(height: context.width * .02),
          SizedBox(
            height: context.width * .12,
            child: FittedBox(
              child: ButtonWidget(
                onPressed: onTap ?? () {},
                width: context.width * .3,
                height: 40,
                text: AppStrings.tryAgain,
                backgroundColor: context.colorScheme.error,
                foregroundColor: context.colorScheme.onError,
              ),
            ),
          ),
        ],
      ),
    ).center();
  }
}
