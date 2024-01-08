import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:hitbitz/features/auth/presentation/widgets/password_text_field.dart';
import 'package:hitbitz/router/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final ValueNotifier<bool> _showPasswordListenable;
  late final ValueNotifier<bool> _rememberMeListenable;

  @override
  void initState() {
    _showPasswordListenable = ValueNotifier(false);
    _rememberMeListenable = ValueNotifier(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('HitBitz'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => context.goNamed(AppRoutes.signup),
            child: TextWidget(
              'Sign up',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(50),
            TextWidget(
              "Welcome back!",
              style: context.textTheme.headlineLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            const Gap(15),
            TextWidget(
              "Nice to see you back, you can log in and continue your learning progress",
              textAlign: TextAlign.center,
              maxLines: 5,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            const Gap(40),
            Column(
              children: [
                const AuthTextField(
                  label: "Username",
                  prefixIcon: FaIcon(FontAwesomeIcons.user),
                ).hero('username-field'),
                const Gap(15),
                PasswordTextField(showPasswordListenable: _showPasswordListenable).hero('password-field'),
              ],
            ),
            const Gap(4),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _rememberMeListenable,
                    builder: (context, remember, _) => Checkbox(
                      checkColor: Colors.white,
                      activeColor: context.colorScheme.primary,
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      value: remember,
                      onChanged: (val) {
                        if (val == null) return;
                        _rememberMeListenable.value = val;
                      },
                    ),
                  ),
                ),
                const TextWidget("Remember me"),
              ],
            ).onTap(() => _rememberMeListenable.value = !_rememberMeListenable.value),
            const Gap(10),
            ButtonWidget(
              width: context.width,
              onPressed: () => context.goNamed(AppRoutes.main),
              foregroundColor: context.colorScheme.onPrimary,
              backgroundColor: context.colorScheme.primary,
              text: "Log in",
            ).hero('auth-button'),
          ],
        ).wrapPadding(AppPadding.pagePadding),
      ),
      bottomNavigationBar: Material(
        child: TextWidget(
          "By creating an account, you agree to ",
          textAlign: TextAlign.center,
          maxLines: 5,
          children: [
            TextWidget("HitBitz's Terms & Conditions", textColor: context.colorScheme.primary),
            const TextWidget(" and "),
            TextWidget("Privacy Policy", textColor: context.colorScheme.primary),
          ],
        ).hero('term-and-Conditions'),
      ).paddingAll(50),
    );
  }
}
