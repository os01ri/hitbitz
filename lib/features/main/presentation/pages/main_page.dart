import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/tab_controller_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/home/presentation/pages/home_page.dart';
import 'package:hitbitz/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  static const _tabs = [
    MainNavigationBarItemWidget(
      icon: FaIcon(FontAwesomeIcons.houseChimney, size: 20),
      label: 'Home',
      index: 0,
    ),
    MainNavigationBarItemWidget(
      icon: FaIcon(FontAwesomeIcons.bookmark, size: 20),
      label: 'library',
      padding: EdgeInsets.only(right: 40),
      index: 1,
    ),
    MainNavigationBarItemWidget(
      icon: FaIcon(FontAwesomeIcons.bell, size: 20),
      label: 'Notifications',
      padding: EdgeInsets.only(left: 40),
      index: 2,
    ),
    MainNavigationBarItemWidget(
      icon: FaIcon(FontAwesomeIcons.user, size: 20),
      label: 'Profile',
      index: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget("HitBitz"),
        actions: [
          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell)),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          HomePage(),
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              context.colorScheme.primary,
              context.colorScheme.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: FloatingActionButton(
          elevation: .0,
          highlightElevation: .0,
          splashColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          child: const FaIcon(
            FontAwesomeIcons.qrcode,
            color: Colors.white,
          ).paddingAll(12.0),
          onPressed: () {
            context.goNamed(AppRoutes.login);
          },
        ),
      ),
    );
  }

  BlocBuilder<NavigationCubit, NavigationState> _buildBottomNavigation() => BlocBuilder<NavigationCubit, NavigationState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return SizedBox(
            height: 90.0,
            // color: Colors.transparent,
            child: BottomAppBar(
              surfaceTintColor: context.colorScheme.background,
              // shadowColor: Colors.black,
              // elevation: 50,
              // color: Colors.white,

              notchMargin: 10,
              shape: const CircularNotchedRectangle(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _tabs
                      .map(
                        (e) => Padding(
                          padding: e.padding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: e.icon,
                                color: state.index == e.index
                                    ? context.colorScheme.primary
                                    : context.colorScheme.outlineVariant,
                                onPressed: () {
                                  if (state.index != e.index) {
                                    context.read<NavigationCubit>().updateNavBarItem(e.index);
                                    _controller.goTo(e.index);
                                  }
                                },
                              ),
                              TextWidget(
                                e.label,
                                textColor: state.index == e.index
                                    ? context.colorScheme.primary
                                    : context.colorScheme.outlineVariant,
                              ),
                            ],
                          ).fit(),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      );
}

class MainNavigationBarItemWidget {
  final Widget icon;
  final String? label;
  final int index;
  final EdgeInsetsGeometry padding;

  const MainNavigationBarItemWidget({
    required this.icon,
    required this.index,
    this.padding = EdgeInsets.zero,
    this.label,
  });
}
