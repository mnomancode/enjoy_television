// ignore_for_file: use_build_context_synchronously

import 'package:enjoy_television/loading_widgets/app_shimmer.dart';
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

    return CircleAvatar(
      backgroundColor: Theme.of(context).cardColor,
      child: IconButton(
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
                  imageUrl:
                      widget.dataModel?.imageUrl ?? widget.newsItem!.image,
                  videoUrl: widget.dataModel?.videoUrl,
                  content: widget.newsItem?.htmlContent,
                  pagePath:
                      widget.dataModel?.pagePath ?? widget.newsItem?.pagePath,
                  date: DateTime.now(),
                );

          status
              ? ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Removed from favorites'),
                    duration: const Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'Undo',
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () async {
                        await favoriteRepository.addFavorite(
                          itemId: id,
                          title:
                              widget.dataModel?.title ?? widget.newsItem!.title,
                          imageUrl: widget.dataModel?.imageUrl ??
                              widget.newsItem!.image,
                          videoUrl: widget.dataModel?.videoUrl,
                          content: widget.newsItem?.htmlContent,
                          pagePath: widget.dataModel?.pagePath ??
                              widget.newsItem?.pagePath,
                          date: DateTime.now(),
                        );
                        setState(() {});
                      },
                    ),
                  ),
                )
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to favorites'),
                    duration: Duration(seconds: 1),
                  ),
                );
          setState(() {});
        },
        icon: FutureBuilder<bool>(
          future: favoriteRepository.isFavorite(widget.itemId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppShimmer(borderRadius: 50, width: 20, height: 20);
            }

            if (snapshot.hasError) {
              return const Icon(Icons.favorite);
            }

            return snapshot.data == true
                ? const Icon(Icons.favorite, color: Colors.red, size: 19)
                : const Icon(Icons.favorite_outline, size: 19);
          },
        ),
      ),
    );
  }
}
