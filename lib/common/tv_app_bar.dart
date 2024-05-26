import 'package:flutter/material.dart';

import '../search/search_results.dart';

class TVAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TVAppBar({super.key, this.title, this.showSearchBtn = false});
  final String? title;
  final bool showSearchBtn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset('assets/icons/logo.png', height: 50),
          const SizedBox(width: 10),
          if (title != null)
            Text(title!, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      actions: !showSearchBtn
          ? null
          : [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  await showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
              ),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

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
    return SearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
