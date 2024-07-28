import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.userProfile,
  });

  final UserProfileModel userProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(width: context.width),
        ClipRRect(
          borderRadius: BorderRadius.circular(context.width),
          child: SizedBox(
            width: context.width * .45,
            child: ImageWidget(path: userProfile.profileImage?.mediaUrl ?? ''),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(10),
            TextWidget(
              userProfile.fullName,
              style: context.textTheme.titleLarge,
            ),
            const Gap(5),
            TextWidget('@${userProfile.userName}'),
            TextWidget(userProfile.email),
            if (userProfile.category != null)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.school_outlined),
                  const Gap(3),
                  TextWidget(userProfile.category?.name),
                ],
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_month),
                TextWidget(userProfile.birthDate?.formatDate()),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
