import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:vibration/vibration.dart';

class Toaster {
  Toaster._();

  static void showToast(String text) {
    closeLoading();
    BotToast.showText(text: text.tr());
  }

  static void showLoading() {
    closeLoading();
    BotToast.showLoading(backButtonBehavior: BackButtonBehavior.close);
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showError({
    required BuildContext context,
    required String? message,
  }) async {
    closeLoading();
    _showNotification(
      title: const TextWidget('Error!'),
      subtitle: TextWidget(message, textColor: context.colorScheme.onError, maxLines: 3),
      leading: Icon(Icons.error_outline_rounded, color: context.colorScheme.error, size: 35),
      backgroundColor: context.colorScheme.errorContainer,
    );

    if (await Vibration.hasVibrator() ?? false) Vibration.vibrate(duration: 150);
  }

  static void showWarning({
    required BuildContext context,
    required String warningMessage,
  }) async {
    closeLoading();
    _showNotification(
      title: const TextWidget('تنبيه!'),
      subtitle: TextWidget(warningMessage, maxLines: 3),
      leading: Icon(Icons.warning_amber_rounded, color: Colors.amber[800], size: 35),
      backgroundColor: Colors.amber[200],
    );

    if (await Vibration.hasVibrator() ?? false) Vibration.vibrate(duration: 150);
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
  }) async {
    closeLoading();
    _showNotification(
      title: TextWidget(
        message,
        maxLines: 3,
        style: TextStyle(color: context.colorScheme.onPrimaryContainer),
      ),
      leading: Icon(Icons.check_circle_outline_rounded, color: context.colorScheme.onPrimaryContainer, size: 35),
      backgroundColor: context.colorScheme.primaryContainer,
    );
  }

  static void showSheet({
    required BuildContext context,
    required Widget sheet,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      useSafeArea: true,
      backgroundColor: context.colorScheme.background,
      builder: (context) => sheet,
    );
  }

  static void _showNotification({
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Color? backgroundColor,
  }) {
    BotToast.showNotification(
      title: (_) => title,
      subtitle: (subtitle != null) ? (_) => subtitle : null,
      leading: (leading != null) ? (_) => leading : null,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 4),
      margin: AppPadding.notificationPadding,
    );
  }

  static showIsCorrect(bool isCorrect) {
    closeLoading();
    _showNotification(
      title: TextWidget(
        isCorrect ? 'Correct!' : 'Wrong!',
        maxLines: 1,
        style: const TextStyle(color: Colors.white),
      ),
      leading: const Icon(Icons.check_circle_outline_rounded, color: Colors.white, size: 35),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
    );
  }
}
