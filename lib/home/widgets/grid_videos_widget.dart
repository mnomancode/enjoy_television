import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../loading_widgets/app_shimmer.dart';
import '../../loading_widgets/grid_videos_loading.dart';
import '../../models/data_model.dart';

class GridVideosWidget extends ConsumerWidget {
  const GridVideosWidget({super.key, required this.path, required this.title});
  final String path;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataModelNotifierProvider(path));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          data.when(
            data: (data) {
              return Expanded(
                child: GridView.builder(
                  addAutomaticKeepAlives: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                        context.goNamed('play-video', queryParameters: {
                          'title': data[index].title,
                          'pageUrl': data[index].pagePath,
                          'videoUrl': data[index].videoUrl,
                          'date': data[index].date ?? '',
                        });
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
                                  height: 115,
                                  fit: BoxFit.cover,
                                  imageUrl: data[index].imageUrl,
                                  placeholder: (context, url) =>
                                      const AppShimmer(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(7, 5, 10, 0),
                                child: Text(
                                  data[index].title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
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
