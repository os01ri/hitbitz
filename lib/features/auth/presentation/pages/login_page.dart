import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/app_validator.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/auth/domain/usecases/login_usecase.dart';
import 'package:hitbitz/features/auth/presentation/cubit/auth_cubit.dart';
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
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final AuthCubit _cubit;

  @override
  void initState() {
    _showPasswordListenable = ValueNotifier(false);
    _rememberMeListenable = ValueNotifier(false);
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    _cubit = di<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _showPasswordListenable.dispose();
    _rememberMeListenable.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
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
            child: Form(
              child: Column(
                children: [
                  const Gap(50),
                  TextWidget(
                    'Welcome back!',
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap(15),
                  TextWidget(
                    'Nice to see you back, you can log in and continue your learning progress',
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  const Gap(40),
                  Column(
                    children: [
                      AuthTextField(
                        label: 'Username',
                        prefixIcon: const FaIcon(FontAwesomeIcons.user),
                        controller: _usernameController,
                        validator: AppValidator.required,
                      ).hero('username-field'),
                      const Gap(15),
                      PasswordTextField(
                        showPasswordListenable: _showPasswordListenable,
                        controller: _passwordController,
                      ).hero('password-field'),
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
                      const TextWidget('Remember me'),
                    ],
                  ).onTap(() => _rememberMeListenable.value = !_rememberMeListenable.value),
                  const Gap(10),
                  Builder(
                    builder: (context) => ButtonWidget(
                      width: context.width,
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          _cubit.login(LoginParams(
                            username: _usernameController.text,
                            password: _passwordController.text,
                            remember: _rememberMeListenable.value,
                          ));
                        }
                      },
                      foregroundColor: context.colorScheme.onPrimary,
                      backgroundColor: context.colorScheme.primary,
                      text: 'Log in',
                    ).hero('auth-button'),
                  ),
                  const Gap(10),
                  ButtonWidget(
                    width: context.width,
                    onPressed: () => context.goNamed(AppRoutes.main),
                    isOutlined: true,
                    borderThickness: 1.5,
                    borderColor: context.colorScheme.primary,
                    foregroundColor: context.colorScheme.onBackground,
                    backgroundColor: context.colorScheme.background,
                    text: 'Continue As Guest',
                  )
                ],
              ).wrapPadding(AppPadding.pagePadding),
            ),
          ),
          bottomNavigationBar: Material(
            child: TextWidget(
              'By creating an account, you agree to ',
              textAlign: TextAlign.center,
              maxLines: 5,
              children: [
                TextWidget("HitBitz's Terms & Conditions", textColor: context.colorScheme.primary),
                const TextWidget(' and '),
                TextWidget('Privacy Policy', textColor: context.colorScheme.primary),
              ],
            ).hero('term-and-Conditions'),
          ).paddingAll(50),
        ),
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.status == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.status == CubitStatus.failure) {
      Toaster.showError(context: context, errorMessage: state.failure?.message);
    } else if (state.status == CubitStatus.success) {
      Toaster.showSuccess(context: context, message: 'Logged  in successfully');
      Future.delayed(const Duration(milliseconds: 500)).whenComplete(() => context.goNamed(AppRoutes.main));
    }
  }
}
