import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extensions.dart';
import '../theme/text_theme.dart';
import 'button_widget.dart';
import 'text_widget.dart';

class AppBarWidget extends AppBar {
  final BuildContext context;
  final String? titleText;
  final Widget? leadingWidget;
  final Widget? icon;
  final List<Widget>? actionWidgets;
  final PreferredSizeWidget? bottomWidget;

  AppBarWidget({
    super.key,
    required this.context,
    this.titleText,
    this.leadingWidget,
    this.actionWidgets,
    this.bottomWidget,
    this.icon,
  }) : super(
          // toolbarHeight: 70,
          elevation: 0,
          backgroundColor: context.colorScheme.background,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                titleText,
                style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900),
              ),
              icon ?? const SizedBox.shrink(),
            ],
          ),
          leadingWidth: 65.w,
          leading: Row(
            children: [
              leadingWidget ??
                  ButtonWidget(
                      onPressed: () => context.pop(),
                      height: 35.w,
                      width: 35.w,
                      prefixIcon: const Icon(Icons.arrow_back_ios_new_rounded)
                      // ImageWidget(
                      //   path: AppAssets.arrowRight,
                      //   color: context.colorScheme.onBackground,
                      //   height: 16.w,
                      //   width: 16.w,
                      // ),
                      ),
            ],
          ).wrapPadding(const EdgeInsetsDirectional.only(start: 15)),
          actions: (actionWidgets ?? []),
          bottom: bottomWidget,
        );
}
