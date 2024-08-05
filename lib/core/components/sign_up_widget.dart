import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/router/app_routes.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: context.colorScheme.primary,
          size: 48,
        ),
        const Gap(15),
        const TextWidget(
          'signUpToUnlockFeature',
          maxLines: 10,
          textAlign: TextAlign.center,
        ),
        const Gap(15),
        ButtonWidget(
          text: AppStrings.signUp,
          backgroundColor: context.colorScheme.primary,
          foregroundColor: context.colorScheme.onPrimary,
          width: context.width * .4,
          onPressed: () => context.goNamed(AppRoutes.signup),
        ),
      ],
    ).center();
  }
}
