import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/friends/presentation/pages/profile_page.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';

class MyRoadmapsPage extends StatelessWidget {
  const MyRoadmapsPage({super.key, required this.roadmaps});

  final List<RoadMapModel> roadmaps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget(AppStrings.roadmap)),
      body: UserRoadMapsList(roadmaps: roadmaps).wrapPadding(AppPadding.pagePadding),
    );
  }
}
