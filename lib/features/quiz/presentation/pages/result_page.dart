import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/num_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/router/app_routes.dart';

class ResultPageArgs {
  final double score;
  final bool hasPassed;

  const ResultPageArgs({
    required this.score,
    required this.hasPassed,
  });
}

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.args,
  });

  final ResultPageArgs args;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (args.hasPassed) context.goNamed(AppRoutes.main);
      },
      child: Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              TextWidget(
                AppStrings.yourScoreIs,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
              const Gap(10),
              CardWidget(
                padding: AppPadding.cardPadding,
                child: TextWidget(
                  '% ${args.score.numberFormat()}',
                  style: context.textTheme.displayLarge?.copyWith(
                    color: args.hasPassed ? Colors.green : Colors.red,
                  ),
                ),
              ),
              const Gap(10),
              TextWidget(
                (args.hasPassed) ? AppStrings.passedQuiz : AppStrings.failedQuiz,
                textAlign: TextAlign.center,
                maxLines: 4,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
              const Spacer(),
              ButtonWidget(
                text: AppStrings.close,
                width: context.width,
                backgroundColor: context.colorScheme.onPrimary,
                onPressed: () => context.goNamed(AppRoutes.main),
              ),
            ],
          ).center().wrapPadding(AppPadding.pagePadding),
        ),
      ),
    );
  }
}
