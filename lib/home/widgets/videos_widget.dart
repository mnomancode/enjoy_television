import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../common/favourite_widget.dart';
import '../../loading_widgets/app_shimmer.dart';
import '../../loading_widgets/hor_list_view_loading.dart';
import '../../models/data_model.dart';

class VideosWidget extends ConsumerWidget {
  const VideosWidget(
      {required this.path, required this.title, this.onTap, super.key});

  final String path;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataModelNotifierProvider(path));

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 43,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              title: Text(title, style: Theme.of(context).textTheme.titleLarge),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              minVerticalPadding: 0,
            ),
          ),
          data.when(
            data: (data) {
              return SizedBox(
                height: 205,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.goNamed('play-video', queryParameters: {
                          'pageTitle': title,
                          'title': data[index].title,
                          'pageUrl': data[index].pagePath,
                          'videoUrl': data[index].videoUrl,
                          'date': data[index].date ?? '',
                          'phpPath': path,
                          'imageUrl': data[index].imageUrl,
                        });
                      },
                      child: Stack(
                        children: [
                          Card(
                            color: const Color(0xFF191919),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: data[index].videoUrl,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        width: 200,
                                        height: 115,
                                        fit: BoxFit.cover,
                                        imageUrl: data[index].imageUrl,
                                        placeholder: (context, url) =>
                                            const AppShimmer(borderRadius: 0),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(7, 5, 10, 0),
                                    child: Text(
                                      data[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (data[index].date != null)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              7, 0, 10, 5),
                                          child: Text(
                                            data[index].date!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: FavoriteWidget(
                                  YoutubePlayer.convertUrlToId(
                                          data[index].videoUrl) ??
                                      '',
                                  data[index],
                                  null)),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            loading: () => const Center(child: HorizontalListViewLoading()),
            error: (error, _) => Center(child: Text(error.toString())),
          ),
        ],
      ),
    );
  }
}
