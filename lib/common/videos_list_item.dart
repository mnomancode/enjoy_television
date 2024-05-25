import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../loading_widgets/app_shimmer.dart';
import '../models/data_model.dart';
import 'favourite_widget.dart';

class VideosListItem extends StatelessWidget {
  const VideosListItem(
      {super.key, required this.itemId, required this.dataModel});
  final String itemId;
  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () => context.goNamed('play-video', queryParameters: {
            'pageTitle': 'Favorites',
            'title': dataModel.title,
            'pageUrl': dataModel.pagePath,
            'videoUrl': dataModel.videoUrl,
            'date': dataModel.date ?? '',
            'phpPath': dataModel.pagePath,
            'isFavorite': 'true',
            'imageUrl': dataModel.imageUrl,
          }),
          child: Card(
            margin: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: dataModel.imageUrl,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const AppShimmer(borderRadius: 0),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 220,
                          child: Text(dataModel.title,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         const Icon(Icons.calendar_today_outlined,
                        //             color: Colors.grey, size: 15),
                        //         const SizedBox(width: 5),
                        //         Text(dataModel.date?.split('T').first ?? '',
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .labelSmall
                        //                 ?.greyColor),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 20, right: 20, child: FavoriteWidget(itemId, dataModel, null)),
      ],
    );
  }
}
