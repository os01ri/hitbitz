import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  // Widget build(BuildContext context) => const CircularProgressIndicator.adaptive().center();
  Widget build(BuildContext context) => SpinKitWave(color: context.colorScheme.primary).center();
}
