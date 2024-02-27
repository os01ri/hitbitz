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
import 'package:hitbitz/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:hitbitz/features/auth/presentation/cubit/auth_cubit.dart';
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

  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;
  late final TextEditingController _birthDateController;

  late final AuthCubit _cubit;

  @override
  void initState() {
    _selectedDate = DateTime.now();
    _showPasswordListenable = ValueNotifier(false);
    _showPasswordConfirmationListenable = ValueNotifier(false);

    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
    _birthDateController = TextEditingController();

    _cubit = di<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _showPasswordListenable.dispose();
    _showPasswordConfirmationListenable.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<AuthCubit, AuthState>(
        listener: _listener,
        child: Form(
          child: Scaffold(
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
                    'Sign up',
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap(15),
                  TextWidget(
                    'The point of your journey together is here, start registering now',
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  const Gap(30),
                  AuthTextField(
                    label: 'Username',
                    prefixIcon: const FaIcon(FontAwesomeIcons.user),
                    controller: _usernameController,
                    validator: AppValidator.required,
                  ).hero('username-field'),
                  const Gap(10),
                  AuthTextField(
                    label: 'Full Name',
                    prefixIcon: const FaIcon(FontAwesomeIcons.userGraduate),
                    controller: _fullNameController,
                    validator: AppValidator.required,
                  ),
                  const Gap(10),
                  AuthTextField(
                    label: 'Email',
                    prefixIcon: const FaIcon(FontAwesomeIcons.envelope),
                    controller: _emailController,
                    validator: AppValidator.email,
                  ),
                  const Gap(10),
                  PasswordTextField(
                    label: 'Password',
                    showPasswordListenable: _showPasswordListenable,
                    controller: _passwordController,
                  ).hero('password-field'),
                  const Gap(10),
                  PasswordTextField(
                    label: 'Password Confirmation',
                    showPasswordListenable: _showPasswordConfirmationListenable,
                    controller: _passwordConfirmationController,
                    validator: (value) {
                      if (value != _passwordController.text) return 'Passwords don\'t match';
                      return null;
                    },
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(1980),
                        lastDate: DateTime(2100),
                      );

                      if (newDate == null) return;
                      setState(() {
                        _selectedDate = newDate;
                        _birthDateController.text = newDate.toIso8601String().substring(0, 10);
                      });
                    },
                    child: AuthTextField(
                      label: 'Date Of Birth',
                      controller: _birthDateController,
                      enabled: false,
                      prefixIcon: const FaIcon(FontAwesomeIcons.calendar),
                      validator: AppValidator.required,
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
                    'By creating an account, you agree to ',
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    children: [
                      TextWidget("HitBitz's Terms & Conditions", textColor: context.colorScheme.primary),
                      const TextWidget(' and '),
                      TextWidget('Privacy Policy', textColor: context.colorScheme.primary),
                    ],
                  ),
                ).hero('term-and-Conditions'),
                const Gap(20),
                Builder(
                  builder: (context) {
                    return ButtonWidget(
                      width: context.width,
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          _cubit.signIn(SignInParams(
                            email: _emailController.text,
                            userName: _usernameController.text,
                            password: _passwordController.text,
                            fullName: _fullNameController.text,
                            birthDate: _selectedDate,
                          ));
                        }
                      },
                      foregroundColor: context.colorScheme.onPrimary,
                      backgroundColor: context.colorScheme.primary,
                      text: 'Sign up',
                    ).hero('auth-button');
                  },
                ),
              ],
            ).wrapPadding(AppPadding.pagePadding),
          ),
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
      Toaster.showSuccess(context: context, message: 'Signed in successfully');
      Future.delayed(const Duration(milliseconds: 300)).whenComplete(() => context.goNamed(AppRoutes.main));
    }
  }
}
