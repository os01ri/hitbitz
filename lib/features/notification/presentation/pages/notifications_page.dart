import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/notification/presentation/cubit/notifications_cubit.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    di<NotificationsCubit>().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget(AppStrings.notifications)),
      body: BlocProvider.value(
        value: di<NotificationsCubit>(),
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            return switch (state.status) {
              CubitStatus.initial => const SizedBox.shrink(),
              CubitStatus.loading => const LoadingWidget().center(),
              CubitStatus.failure => ErrorButtonWidget(onTap: di<NotificationsCubit>().getNotifications).center(),
              CubitStatus.success => RefreshIndicator(
                  onRefresh: () async => di<NotificationsCubit>().getNotifications(),
                  child: ListView.separated(
                    padding: AppPadding.listViewPadding,
                    itemCount: state.notifications.length,
                    separatorBuilder: (context, index) => const Gap(10),
                    itemBuilder: (context, index) => CardWidget(
                      isShadowed: true,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidBell,
                          color: index <= 1 ? context.colorScheme.primary : null,
                        ),
                        title: TextWidget(state.notifications[index].title),
                        subtitle: TextWidget(state.notifications[index].body),
                      ),
                    ),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
