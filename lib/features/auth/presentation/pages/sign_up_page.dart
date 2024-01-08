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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late DateTime _selectedDate;
  late final ValueNotifier<bool> _showPasswordListenable;
  late final ValueNotifier<bool> _showPasswordConfirmationListenable;
  late final TextEditingController _dateOfBirth;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _showPasswordListenable = ValueNotifier(false);
    _showPasswordConfirmationListenable = ValueNotifier(false);
    _dateOfBirth = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('HitBitz'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => context.goNamed(AppRoutes.login),
            child: TextWidget(
              'Log in',
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
            TextWidget(
              "Sign up",
              style: context.textTheme.headlineLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            const Gap(15),
            TextWidget(
              "The point of your journey together is here, start registering now",
              textAlign: TextAlign.center,
              maxLines: 5,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            const Gap(20),
            const Gap(10),
            const AuthTextField(label: "Username", prefixIcon: FaIcon(FontAwesomeIcons.user)).hero('username-field'),
            const Gap(10),
            const AuthTextField(label: "Phone Number", prefixIcon: FaIcon(FontAwesomeIcons.mobileScreen)),
            const Gap(10),
            PasswordTextField(
              label: "Password",
              showPasswordListenable: _showPasswordListenable,
            ).hero('password-field'),
            const Gap(10),
            PasswordTextField(
              label: "Password Confirmation",
              showPasswordListenable: _showPasswordConfirmationListenable,
            ),
            const Gap(10),
            GestureDetector(
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                    context: context, initialDate: _selectedDate, firstDate: DateTime(1980), lastDate: DateTime(2100));

                if (newDate == null) return;
                setState(() {
                  _selectedDate = newDate;
                  _dateOfBirth.text = newDate.toIso8601String().substring(0, 10);
                  print(newDate);
                });
              },
              child: AuthTextField(
                label: "Date Of Birth",
                controller: _dateOfBirth,
                enabled: false,
                prefixIcon: const FaIcon(FontAwesomeIcons.calendar),
              ),
            ),
          ],
        ).wrapPadding(AppPadding.pagePadding),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            child: TextWidget(
              "By creating an account, you agree to ",
              textAlign: TextAlign.center,
              maxLines: 5,
              children: [
                TextWidget("HitBitz's Terms & Conditions", textColor: context.colorScheme.primary),
                const TextWidget(" and "),
                TextWidget("Privacy Policy", textColor: context.colorScheme.primary),
              ],
            ),
          ).hero('term-and-Conditions'),
          const Gap(20),
          ButtonWidget(
            width: context.width,
            onPressed: () => context.goNamed(AppRoutes.main),
            foregroundColor: context.colorScheme.onPrimary,
            backgroundColor: context.colorScheme.primary,
            text: "Sign up",
          ).hero('auth-button'),
        ],
      ).wrapPadding(AppPadding.pagePadding),
    );
  }
}
