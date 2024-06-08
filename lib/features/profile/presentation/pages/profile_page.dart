import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/drop_down_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/utilities/app_localization.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      ).wrapPadding(AppPadding.pagePadding),
    );
  }
}
