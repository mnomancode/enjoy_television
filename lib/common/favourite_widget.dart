import 'package:enjoy_television/news/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../database/repository/favorites_impl.dart';
import '../models/data_model.dart';

class FavoriteWidget extends ConsumerStatefulWidget {
  const FavoriteWidget(this.itemId, this.dataModel, this.newsItem, {super.key});
  final String itemId;
  final DataModel? dataModel;
  final News? newsItem;

  @override
  ConsumerState<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends ConsumerState<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteRepository =
        ref.watch(favoriteRepositoryImplProvider.notifier);

    return IconButton(
      onPressed: () async {
        String id =
            YoutubePlayer.convertUrlToId(widget.dataModel?.videoUrl ?? '') ??
                widget.newsItem!.id.toString();

        bool status = await favoriteRepository.isFavorite(widget.itemId);

        status
            ? await favoriteRepository.removeFavorite(widget.itemId)
            : await favoriteRepository.addFavorite(
                itemId: id,
                title: widget.dataModel?.title ?? widget.newsItem!.title,
                imageUrl: widget.dataModel?.imageUrl ?? widget.newsItem!.image,
                videoUrl: widget.dataModel?.videoUrl,
                content: widget.newsItem?.htmlContent,
                pagePath:
                    widget.dataModel?.pagePath ?? widget.newsItem?.pagePath,
                date: DateTime.now(),
              );
        setState(() {});
      },
      icon: FutureBuilder<bool>(
        future: favoriteRepository.isFavorite(widget.itemId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return const Icon(Icons.favorite);
          }

          return snapshot.data == true
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_outline);
        },
      ),
    );
  }
}
