import 'package:enjoy_television/database/repository/favorites_impl.dart';
import 'package:enjoy_television/common/news_list_item.dart';
import 'package:enjoy_television/loading_widgets/news_list_loading.dart';
import 'package:enjoy_television/news/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/drawer/drawer_widget.dart';
import '../../common/tv_app_bar.dart';
import '../../common/videos_list_item.dart';
import '../../database/database_impl.dart';
import '../../models/data_model.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRepository =
        ref.watch(favoriteRepositoryImplProvider.notifier);

    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: const DrawerWidget(),
        appBar: const TVAppBar(),
        body: StreamBuilder(
          stream: favoriteRepository.watchFavorite(),
          builder: (context, AsyncSnapshot<List<Favorite>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const NewsListViewLoading();
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }

            if (snapshot.data!.isEmpty) {
              return const Center(child: Text('No favorites'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final favorite = snapshot.data![index];

                bool isNews = favorite.content != null;
                return isNews
                    ? NewsListItem(
                        isFavorite: true,
                        newsItem: News(
                          title: favorite.title,
                          id: favorite.itemId,
                          image: favorite.imageUrl,
                          htmlContent: favorite.content,
                          pagePath: favorite.pagePath,
                          // date: DateFormat('dd MMMM yyyy')
                          //     .format(favorite.date ?? DateTime.now()),
                        ))
                    : VideosListItem(
                        itemId: favorite.itemId,
                        dataModel: DataModel(
                          title: favorite.title,
                          imageUrl: favorite.imageUrl!,
                          videoUrl: favorite.videoUrl!,
                          pagePath: favorite.pagePath,
                          // date: DateFormat('dd MMMM yyyy')
                          //     .format(favorite.date ?? DateTime.now()),
                        ),
                      );
              },
            );
          },
        ));
  }
}
