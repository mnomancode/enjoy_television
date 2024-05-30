import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../utils/utils.dart';
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
        if (data == null) {
          return const Center(
            child: Text('No data found'),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey[900],
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (page > 1) {
                    page--;
                    setState(() {});
                  }
                },
              ),
              Text('Page $page Of ${data.totalPages}'),
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
              itemCount: data.data?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async => context
                      .goNamed('search-play-video-screen', queryParameters: {
                    'title': data.data![index].title,
                    'date': data.data![index].date,
                    'postUrl': data.data![index].postUrl,
                  }),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.data![index].title,
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(data.data![index].date,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.greyColor),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
      error: (error, stack) => const Center(child: Text('No data found')),
    );
  }
}
