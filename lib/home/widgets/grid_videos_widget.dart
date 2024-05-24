import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../loading_widgets/app_shimmer.dart';
import '../../loading_widgets/grid_videos_loading.dart';
import '../../models/data_model.dart';
import '../../video_player/video_player_provider.dart';

class GridVideosWidget extends ConsumerWidget {
  const GridVideosWidget({
    super.key,
    required this.path,
    required this.title,
    this.controller,
  });
  final String path;
  final String title;
  final YoutubePlayerController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataModelNotifierProvider(path));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 7),
          Text(title, style: Theme.of(context).textTheme.titleSmall!.greyColor),
          const SizedBox(height: 7),
          data.when(
            data: (data) {
              return Expanded(
                child: GridView.builder(
                  addAutomaticKeepAlives: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(videPlayerProvider.notifier)
                            .updateDataModel(data[index]);

                        if (controller != null) {
                          controller!.load(YoutubePlayer.convertUrlToId(
                              data[index].videoUrl)!);
                        }
                      },
                      child: Card(
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
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  width: 200,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  imageUrl: data[index].imageUrl,
                                  placeholder: (context, url) =>
                                      const AppShimmer(borderRadius: 0),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(7, 5, 20, 0),
                                child: Text(
                                  data[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              const Spacer(),
                              if (data[index].date != null)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          7, 5, 10, 5),
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
                    );
                  },
                ),
              );
            },
            loading: () => const Center(child: GridVideosLoading()),
            error: (error, _) => Center(child: Text(error.toString())),
          ),
        ],
      ),
    );
  }
}
