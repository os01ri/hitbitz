import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/domain/usecases/get_roadmaps_usecase.dart';
import 'package:hitbitz/features/home/presentation/cubit/home_cubit.dart';

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
          child: FaIcon(
            FontAwesomeIcons.penNib,
            color: context.colorScheme.primary,
          ),
        ),
        const Gap(5),
        TextWidget(category.name),
      ],
    ).onTap(() => context.read<HomeCubit>().getRoadMaps(GetRoadMapsParams(categoryId: category.id)));
  }
}
