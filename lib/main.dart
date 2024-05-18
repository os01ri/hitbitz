import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitbitz/core/config/app_assets.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/services/shared_preferences_service.dart';
import 'package:hitbitz/core/theme/light/light_theme.dart';
import 'package:hitbitz/core/utilities/app_localization.dart';
import 'package:hitbitz/features/main/presentation/cubit/nav_cubit/navigation_cubit.dart';
import 'package:hitbitz/router/app_pages.dart';

import 'core/services/notification_service.dart';

void main() async {
  await _initializations();
  runApp(const HitBitzApp());
}

Future _initializations() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    NotificationService.init(),
    EasyLocalization.ensureInitialized(),
    SharedPreferencesService.init(),
    configureDependencies(),
  ]);

  EasyLocalization.logger.enableLevels = [];
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class HitBitzApp extends StatelessWidget {
  const HitBitzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      startLocale: AppLocalization.enLocale,
      supportedLocales: AppLocalization.supportedLocales,
      path: AppAssets.translationFolder,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: ScreenUtilInit(
        designSize: const Size(360.0, 780.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(accessibleNavigation: false),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => NavigationCubit()),
              ],
              child: MaterialApp.router(
                title: 'HitBitz',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: lightTheme,
                // darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                routerConfig: AppPages.router,
                builder: BotToastInit(),
              ),
            ),
          );
        },
      ),
    );
  }
}
