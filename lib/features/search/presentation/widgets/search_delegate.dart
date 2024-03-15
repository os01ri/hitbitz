import 'package:flutter/material.dart';
import 'package:hitbitz/features/search/presentation/pages/search_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search result widget here based on the query
    return const SearchPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions here based on the query
    return const Column(); // Placeholder for suggestions
  }
}
