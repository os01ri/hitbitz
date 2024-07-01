import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/router/app_routes.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.users,
    this.onTailingTapped,
    this.trailingIcon = Icons.add,
  });

  final List<UserModel> users;
  final IconData trailingIcon;
  final Function(int id)? onTailingTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppPadding.listViewPadding,
      itemCount: users.length,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) => CardWidget(
        isShadowed: true,
        child: ListTile(
          onTap: () => context.pushNamed(AppRoutes.profile, extra: users[index].id),
          leading: ImageWidget(width: 50, path: users[index].profileImage?.mediaUrl ?? ''),
          title: TextWidget(users[index].fullName),
          subtitle: TextWidget('@${users[index].userName}'),
          trailing: onTailingTapped == null
              ? null
              : CardWidget(
                  onTap: () => onTailingTapped?.call(users[index].id),
                  height: 30,
                  width: 30,
                  borderRadius: 20,
                  color: context.colorScheme.secondary,
                  child: Icon(trailingIcon, color: context.colorScheme.onSecondary),
                ),
        ),
      ),
    );
  }
}
