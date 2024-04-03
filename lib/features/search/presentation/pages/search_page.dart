import 'package:flutter/material.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/presentation/widgets/category_card.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/saved_roadmaps_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Categories'),
          Tab(text: 'Roadmaps'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(
            padding: AppPadding.gridViewPadding,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: 30,
            itemBuilder: (context, index) =>
                CategoryCard(category: CategoryModel(id: 0, name: 'Test')),
          ),
          const SavedRoadmapsPage(),
        ],
      ),
    );
  }
}
