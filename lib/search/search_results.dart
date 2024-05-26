import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository/search_impl.dart';

class SearchResults extends ConsumerStatefulWidget {
  const SearchResults(this.query, {super.key});
  final String query;

  @override
  ConsumerState<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends ConsumerState<SearchResults> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    final searchResult = ref
        .watch(searchRepositoryImplProvider(query: widget.query, page: page));

    return searchResult.when(
      data: (data) {
        return Scaffold(
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Text('Page $page Of ${data?.totalPages}'),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  page++;
                  setState(() {});
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: data?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data!.data![index].title,
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(data.data![index].date,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.greyColor),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
