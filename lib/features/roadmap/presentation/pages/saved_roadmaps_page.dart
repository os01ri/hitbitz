import 'package:flutter/material.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/home/presentation/widgets/road_map_card.dart';

class SavedRoadmapsPage extends StatelessWidget {
  const SavedRoadmapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: AppPadding.gridViewPadding,
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => RoadMapCard(
          roadMap: RoadMapModel(
            id: index,
            name: 'Test Roadmap' * 5,
            description:
                'This is a test roadmap, This is a test roadmap, This is a test roadmap, This is a test roadmap, This is a test roadmap, This is a test roadmap, This is a test roadmap, ',
            rate: 3,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            subcategoryId: 1,
          ),
        ),
      ),
    );
  }
}
