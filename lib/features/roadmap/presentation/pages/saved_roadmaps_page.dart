import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/home/presentation/widgets/road_map_card.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';

class SavedRoadmapsPage extends StatefulWidget {
  const SavedRoadmapsPage({super.key});

  @override
  State<SavedRoadmapsPage> createState() => _SavedRoadmapsPageState();
}

class _SavedRoadmapsPageState extends State<SavedRoadmapsPage> {
  @override
  void initState() {
    super.initState();
    di<RoadmapCubit>().getSavedRoadmaps();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<RoadmapCubit>(),
      child: Scaffold(
        body: BlocBuilder<RoadmapCubit, RoadmapState>(
          builder: (context, state) {
            return GridView.builder(
              padding: AppPadding.gridViewPadding,
              itemCount: state.savedRoadMaps.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 260,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => RoadMapCard(roadMap: state.savedRoadMaps[index]),
            );
          },
        ),
      ),
    );
  }
}
