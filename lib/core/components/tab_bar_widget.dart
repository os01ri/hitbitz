import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/tab_controller_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

class TabBarWidget extends StatefulWidget {
  TabBarWidget({
    super.key,
    ValueNotifier<int>? currentPageIndex,
    required this.tabController,
    required this.tabsTitles,
    this.activeTabColor,
    this.inactiveTabColor,
    this.activeTabTextColor,
    this.inactiveTabTextColor,
    this.tabBarColor,
  }) : currentPageIndex = currentPageIndex ?? ValueNotifier(0);

  final TabController tabController;
  final ValueNotifier<int> currentPageIndex;
  final List<String> tabsTitles;
  final Color? activeTabColor;
  final Color? inactiveTabColor;
  final Color? activeTabTextColor;
  final Color? inactiveTabTextColor;
  final Color? tabBarColor;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(
      () => widget.currentPageIndex.value = widget.tabController.index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.currentPageIndex,
      builder: (context, pageIndex, _) {
        return CardWidget(
          color: widget.tabBarColor ?? context.colorScheme.surface,
          height: AppDimensions.tapBarHeight,
          padding: AppPadding.tapBarPadding,
          isOutlined: true,
          child: Row(
            children: List.generate(
              widget.tabsTitles.length,
              (index) => ButtonWidget(
                onPressed: () => _goToPage(index),
                text: widget.tabsTitles[index],
                backgroundColor: pageIndex == index
                    ? (widget.activeTabColor ?? context.colorScheme.primary)
                    : (widget.inactiveTabColor ?? context.colorScheme.surface),
                foregroundColor: (pageIndex == index
                    ? (widget.activeTabTextColor ?? context.colorScheme.onPrimary)
                    : (widget.inactiveTabTextColor ?? context.colorScheme.onSurfaceVariant)),
              )
                  .wrapPadding(
                    (index != widget.tabsTitles.length - 1) ? const EdgeInsetsDirectional.only(end: 5) : AppPadding.zero,
                  )
                  .expand(),
            ),
          ),
        );
      },
    );
  }

  _goToPage(int index) {
    widget.currentPageIndex.value = index;
    widget.tabController.goTo(index);
  }
}
