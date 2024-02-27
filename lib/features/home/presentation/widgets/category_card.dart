import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';

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
    );
  }
}
