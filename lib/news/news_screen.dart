import 'package:enjoy_television/common/news_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/image_path.dart';
import '../loading_widgets/news_list_loading.dart';
import 'news_provider.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(newsNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(ImagePath.newsGenre.name,
                  style: Theme.of(context).textTheme.titleLarge),
              background: Stack(
                children: [
                  Image.asset(ImagePath.newsGenre.imagePath,
                      fit: BoxFit.contain),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.1),
                        ],
                        stops: const [0.3, 0.9],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          data.when(data: (newsList) {
            return SliverList.builder(
              itemBuilder: (context, index) =>
                  NewsListItem(newsItem: newsList[index]),
              itemCount: newsList.length,
            );
          }, loading: () {
            return const SliverFillRemaining(
              child: Center(child: NewsListViewLoading()),
            );
          }, error: (error, _) {
            return SliverFillRemaining(
              child: Center(
                child: Text('Error: $error'),
              ),
            );
          }),
        ],
      ),
    );
  }
}
