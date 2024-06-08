import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/bottom_sheet_widget.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/drop_down_widget.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/home/presentation/pages/home_page.dart';
import 'package:hitbitz/features/main/data/enums/feedback_type.dart';
import 'package:hitbitz/features/main/domain/usecases/make_suggestion_usecase.dart';
import 'package:hitbitz/features/main/presentation/cubit/main_cubit/main_cubit.dart';
import 'package:hitbitz/features/main/presentation/cubit/nav_cubit/navigation_cubit.dart';
import 'package:hitbitz/features/notification/presentation/pages/notifications_page.dart';
import 'package:hitbitz/features/profile/presentation/pages/profile_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/saved_roadmaps_page.dart';
import 'package:hitbitz/features/search/presentation/widgets/search_delegate.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

part '../widgets/feedback_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late final PageController _controller;
  late final ValueNotifier<int> _index;

  @override
  void initState() {
    super.initState();
    _index = ValueNotifier(0);
    _controller = PageController();
  }

  @override
  void dispose() {
    _index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('HitBitz').wrapPadding(AppPadding.appBarLeadingPadding),
        actions: [
          IconButton(
            tooltip: AppStrings.report,
            onPressed: () => Toaster.showSheet(
              context: context,
              sheet: const _FeedbackSheet(),
            ),
            icon: const FaIcon(FontAwesomeIcons.commentDots),
          ).wrapPadding(AppPadding.appBarActionsPadding),
          IconButton(
            onPressed: () => showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ).wrapPadding(AppPadding.appBarActionsPadding),
          // IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell)),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (value) => _index.value = value,
        children: const [
          HomePage(),
          SavedRoadmapsPage(),
          NotificationsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  BlocBuilder<NavigationCubit, NavigationState> _buildBottomNavigation() => BlocBuilder<NavigationCubit, NavigationState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return ValueListenableBuilder<int>(
            valueListenable: _index,
            builder: (context, index, _) => CardWidget(
              isShadowed: true,
              color: Colors.white,
              padding: AppPadding.zero,
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: SalomonBottomBar(
                currentIndex: index,
                backgroundColor: context.colorScheme.surface,
                itemShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                selectedItemColor: context.colorScheme.primary,
                unselectedItemColor: context.colorScheme.outline,
                onTap: (i) {
                  _controller.jumpToPage(i);
                  _index.value = i;
                },
                items: [
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.house, size: 18),
                    title: TextWidget(
                      AppStrings.home,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.solidBookmark, size: 18),
                    title: TextWidget(
                      AppStrings.library,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.solidBell, size: 18),
                    title: TextWidget(
                      AppStrings.notifications,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.solidUser, size: 18),
                    title: TextWidget(
                      AppStrings.profile,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
