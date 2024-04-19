part of '../pages/home_page.dart';

class _SearchCard extends StatelessWidget {
  const _SearchCard();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      borderRadius: AppDimensions.mediumBorderRadius,
      padding: AppPadding.innerCardPadding,
      color: context.colorScheme.primary,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.book,
                color: context.colorScheme.onPrimary,
              ),
              const Gap(10),
              TextWidget(
                'HitBitz',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const Gap(20),
          TextWidget(
            'Hello, ${SharedPreferencesService.getFullName() ?? 'Guest'}!',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap(2),
          TextWidget(
            'Find the roadmap or field you like here',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          // const Gap(20),
          // TextFieldWidget(
          //   controller: TextEditingController(),
          //   borderColor: context.colorScheme.onPrimary,
          //   prefixIcon: const FaIcon(FontAwesomeIcons.magnifyingGlass).paddingAll(12),
          //   hint: 'search',
          //   textInputAction: TextInputAction.search,
          //   onSubmitted: (_) => context.pushNamed(AppRoutes.roadmapSearchResults),
          // ),
          // const Gap(20),
        ],
      ),
    );
  }
}
