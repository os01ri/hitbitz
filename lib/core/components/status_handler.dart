import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/empty_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

class StatusHandler extends StatelessWidget {
  const StatusHandler({
    super.key,
    required this.status,
    required this.successWidget,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.isEmpty = false,
    this.onErrorTapped,
  });

  final CubitStatus status;
  final Widget successWidget;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final bool isEmpty;
  final VoidCallback? onErrorTapped;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      CubitStatus.initial => const SizedBox.shrink(),
      CubitStatus.failure => errorWidget ?? ErrorButtonWidget(onTap: onErrorTapped).center(),
      CubitStatus.loading => loadingWidget ?? const LoadingWidget().center(),
      CubitStatus.success => (isEmpty) ? (emptyWidget ?? const EmptyWidget().center()) : successWidget,
    };
  }
}
