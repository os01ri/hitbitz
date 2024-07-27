import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/drop_down_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/services/shared_preferences_service.dart';
import 'package:hitbitz/core/utilities/app_localization.dart';
import 'package:hitbitz/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hitbitz/features/profile/presentation/widgets/profile_widget.dart';
import 'package:hitbitz/router/app_routes.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late final ValueNotifier<Locale> _lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lang = ValueNotifier(context.locale);
  }

  @override
  void dispose() {
    _lang.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocProvider.value(
            value: di<ProfileCubit>()..getProfile(),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) => switch (state.getStatus) {
                CubitStatus.initial => const SizedBox.shrink(),
                CubitStatus.loading => const LoadingWidget().center(),
                CubitStatus.failure => ErrorButtonWidget(onTap: () => di<ProfileCubit>().getProfile()),
                CubitStatus.success => ProfileWidget(userProfile: state.profile!),
              },
            ),
          ),
          const Gap(30),
          Row(
            children: [
              ButtonWidget(
                text: AppStrings.friendRequests,
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
                spaceBetween: 10,
                prefixIcon: FaIcon(FontAwesomeIcons.users, color: context.colorScheme.onPrimary, size: 16),
                onPressed: () => context.pushNamed(AppRoutes.friendRequests),
              ).expand(),
              const Gap(5),
              ButtonWidget(
                text: AppStrings.friends,
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
                spaceBetween: 10,
                prefixIcon: FaIcon(FontAwesomeIcons.userGroup, color: context.colorScheme.onPrimary, size: 16),
                onPressed: () => context.pushNamed(AppRoutes.friends),
              ).expand(),
            ],
          ),
          const Gap(10),
          SizedBox(
            // height: AppDimensions.buttonHeight,
            width: context.width,
            child: DropDownWidget<Locale>(
              // label: 'اللغة',
              listenableValue: _lang,
              items: AppLocalization.supportedLocales
                  .map((e) => DropdownMenuItem<Locale>(
                        value: e,
                        child: TextWidget(e.languageCode),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                context.setLocale(value);
              },
            ).center(),
          ),
          const Gap(10),
          ButtonWidget(
            text: AppStrings.logOut,
            width: context.width,
            backgroundColor: context.colorScheme.error,
            foregroundColor: context.colorScheme.onError,
            onPressed: () async {
              await SharedPreferencesService.clearStorage();
              if (context.mounted) context.goNamed(AppRoutes.splash);
            },
          ),
        ],
      ).wrapPadding(AppPadding.pagePadding).scrollable(),
    );
  }
}
