import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/cached_network_image.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/domain/usecases/get_roadmaps_usecase.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(
          color: context.colorScheme.primaryContainer,
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(15),
          child: NetworkImageWidget(
            url: category.image!.mediaUrl,
            hash: category.image!.hash,
          ),
        ),
        const Gap(5),
        TextWidget(category.name),
      ],
    ).onTap(() => di<RoadmapCubit>().getRoadMaps(GetRoadMapsParams(categoryId: category.id)));
  }
}
