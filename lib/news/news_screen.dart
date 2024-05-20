import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/loading_widgets/grid_videos_loading.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/image_path.dart';
import '../loading_widgets/app_shimmer.dart';
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
          // convert this to date time 2024-05-02T18:33:08

          data.when(data: (newsList) {
            // log('newsList: ${newsList[0].date}');
            // var date = DateTime.parse('2024-05-02T18:33:08');
            // var formattedDate = '${date.day}/${date.month}/${date.year}';
            // log('formattedDate: $formattedDate');
            return SliverList.builder(
              itemBuilder: (context, index) => Stack(
                alignment: Alignment.topRight,
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.pushNamed('news-read-screen', queryParameters: {
                      'id': newsList[index].id,
                      'title': newsList[index].title,
                      'content': newsList[index].htmlContent ?? '',
                      'date': newsList[index].date ?? '',
                    }),
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: newsList[index].image ?? '',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(newsList[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                              Icons.calendar_today_outlined,
                                              size: 15),
                                          const SizedBox(width: 5),
                                          Text(
                                              newsList[index]
                                                      .date
                                                      ?.split('T')
                                                      .first ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.greyColor),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.menu_book_outlined,
                                              size: 15),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${newsList[index].readTime ?? ''} read',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.greyColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(Icons.favorite_border_outlined, size: 30),
                  )
                ],
              ),
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




//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   final news = newsList[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl: news.image ?? '',
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) =>
//                                 const AppShimmer(borderRadius: 0),
//                           ),
//                         ),
//                         ListTile(
//                           title: Text(news.title),
//                           onTap: () {
//                             // context.goNamed('play-video',
//                             //     query: {
//                             //       'pageTitle': news.title,
//                             //       'phpPath': news.pagePath ?? '',
//                             //       'pageUrl': news.pagePath ?? '',
//                             //       'videoUrl': news.htmlContent ?? '',
//                             //       'date': news.date ?? '',
//                             //       'title': news.title,
//                             //     });
//                           },
//                         ),
//                         const Divider(),
//                       ],
//                     ),
//                   );
//                 },
//                 childCount: newsList.length,
//               ),
//             );
//           }, loading: () {
//             return const SliverFillRemaining(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }, error: (error, _) {
//             return SliverFillRemaining(
//               child: Center(
//                 child: Text('Error: $error'),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
