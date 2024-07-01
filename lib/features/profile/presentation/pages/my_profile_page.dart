import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/drop_down_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/utilities/app_localization.dart';
import 'package:hitbitz/features/friends/presentation/pages/profile_page.dart';
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
          const ProfileWidget(id: 3),
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
        ],
      ).wrapPadding(AppPadding.pagePadding).scrollable(),
    );
  }
}
