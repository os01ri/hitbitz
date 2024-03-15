import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/home/presentation/pages/home_page.dart';
import 'package:hitbitz/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:hitbitz/features/notification/presentation/pages/notifications_page.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/saved_roadmaps_page.dart';
import 'package:hitbitz/features/search/presentation/widgets/search_delegate.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
            onPressed: () => showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ).wrapPadding(AppPadding.appBarActionsPadding),
          // IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell)),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (value) => _index.value = value,
        children: [
          const HomePage(),
          const SavedRoadmapsPage(),
          const NotificationsPage(),
          const TextWidget('Profile').center(),
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
                      'Home',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.solidBookmark, size: 18),
                    title: TextWidget(
                      'Library',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.solidBell, size: 18),
                    title: TextWidget(
                      'Notifications',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.solidUser, size: 18),
                    title: TextWidget(
                      'Profile',
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
