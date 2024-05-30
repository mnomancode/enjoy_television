import 'package:enjoy_television/search/search_results.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';

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
    return query.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search, size: 80, color: Color(0xFF878787)),
                Text('Search for something',
                    style: Theme.of(context).textTheme.titleMedium?.greyColor),
              ],
            ),
          )
        : SearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
