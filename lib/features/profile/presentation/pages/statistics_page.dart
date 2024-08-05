import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key, required this.profile});

  final UserProfileModel profile;

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('failed'.tr(), widget.profile.totalFails ?? 0),
      _ChartData('passed'.tr(), widget.profile.totalSuccess ?? 0),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget(AppStrings.statistics)),
      body: Column(
        children: [
          CardWidget(
            isShadowed: true,
            margin: AppPadding.zero,
            child: SfCircularChart(
              tooltipBehavior: _tooltip,
              legend: const Legend(isVisible: true),
              title: ChartTitle(text: 'testStatistics'.tr()),
              series: <CircularSeries<_ChartData, String>>[
                DoughnutSeries<_ChartData, String>(
                  name: AppStrings.quizzes.tr(),
                  dataSource: data,
                  // dataLabelSettings: const DataLabelSettings(
                  //   isVisible: true,
                  //   showCumulativeValues: true,
                  // ),
                  enableTooltip: true,
                  explode: true,
                  legendIconType: LegendIconType.circle,
                  pointColorMapper: (datum, index) => index == 0 ? const Color(0xff7E57C2) : context.colorScheme.primary,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                )
              ],
            ),
          ),
        ],
      ).wrapPadding(AppPadding.pagePadding),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final int y;
}
