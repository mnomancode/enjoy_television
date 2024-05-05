import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../loading_widgets/app_shimmer.dart';
import '../../loading_widgets/grid_videos_loading.dart';
import '../../models/data_model.dart';

class VideosWidget extends ConsumerWidget {
  const VideosWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataModelNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.all(0),
            title: Text('Festivals & Clubs',
                style: Theme.of(context).textTheme.titleLarge),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          data.when(
            data: (data) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF191919),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                            placeholder: (context, url) => const AppShimmer(),
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
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
