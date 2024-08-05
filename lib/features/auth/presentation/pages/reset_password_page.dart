import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/app_validator.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:hitbitz/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hitbitz/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:hitbitz/features/auth/presentation/widgets/password_text_field.dart';
import 'package:hitbitz/router/app_routes.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final AuthCubit _cubit;

  late final TextEditingController _emailController;
  late final TextEditingController _codeController;

  late final TextEditingController _passwordController;
  late final ValueNotifier<bool> _showPasswordListenable;

  late final TextEditingController _passwordConfirmationController;
  late final ValueNotifier<bool> _showPasswordConfirmationListenable;

  @override
  void initState() {
    _cubit = di<AuthCubit>();

    _emailController = TextEditingController();
    _codeController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();

    _showPasswordListenable = ValueNotifier(false);
    _showPasswordConfirmationListenable = ValueNotifier(false);

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _showPasswordConfirmationListenable.dispose();
    _showPasswordListenable.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<AuthCubit, AuthState>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(
            title: const TextWidget('HitBitz'),
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                onPressed: () => context.goNamed(AppRoutes.login),
                child: TextWidget(
                  AppStrings.logIn,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const Gap(50),
                  TextWidget(
                    AppStrings.resetPassword,
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap(40),
                  Column(
                    children: [
                      AuthTextField(
                        label: AppStrings.email,
                        prefixIcon: const FaIcon(FontAwesomeIcons.envelope),
                        controller: _emailController,
                        validator: AppValidator.email,
                      ).hero('email_field'),
                      const Gap(15),
                      AuthTextField(
                        label: AppStrings.code,
                        prefixIcon: const FaIcon(FontAwesomeIcons.code),
                        controller: _codeController,
                        validator: (value) {
                          if (value == null) return AppStrings.codeIncorrect.tr();
                          if (int.tryParse(value) == null) return AppStrings.codeIncorrect.tr();
                          return null;
                        },
                      ),
                      const Gap(15),
                      PasswordTextField(
                        showPasswordListenable: _showPasswordListenable,
                        controller: _passwordController,
                      ).hero('password-field'),
                      const Gap(10),
                      PasswordTextField(
                        label: AppStrings.passwordConfirmation,
                        showPasswordListenable: _showPasswordConfirmationListenable,
                        controller: _passwordConfirmationController,
                        validator: (value) {
                          if (value != _passwordController.text) return AppStrings.passwordNotMatch.tr();
                          return null;
                        },
                      ),
                    ],
                  ),
                  const Gap(10),
                  Builder(
                    builder: (context) => ButtonWidget(
                      width: context.width,
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          _cubit.resetPassword(ResetPasswordParams(
                            email: _emailController.text,
                            code: _codeController.text,
                            newPassword: _passwordController.text,
                          ));
                        }
                      },
                      foregroundColor: context.colorScheme.onPrimary,
                      backgroundColor: context.colorScheme.primary,
                      text: AppStrings.send,
                    ).hero('auth-button'),
                  ),
                  const Gap(10),
                ],
              ).wrapPadding(AppPadding.pagePadding),
            ),
          ),
          // bottomNavigationBar: Material(
          //   child: TextWidget(
          //     AppStrings.agreeingTo,
          //     textAlign: TextAlign.center,
          //     maxLines: 5,
          //     children: [
          //       const TextWidget(' '),
          //       TextWidget(AppStrings.termsAnConditions, textColor: context.colorScheme.primary),
          //       const TextWidget(AppStrings.and),
          //       TextWidget(AppStrings.privacyPolicy, textColor: context.colorScheme.primary),
          //     ],
          //   ).hero('term-and-Conditions'),
          // ).paddingAll(50),
        ),
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.status == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.status == CubitStatus.failure) {
      Toaster.showError(context: context, message: state.failure?.message);
    } else if (state.status == CubitStatus.success) {
      Toaster.showSuccess(context: context, message: AppStrings.done);
      Future.delayed(const Duration(milliseconds: 500)).whenComplete(() => context.goNamed(AppRoutes.login));
    }
  }
}
