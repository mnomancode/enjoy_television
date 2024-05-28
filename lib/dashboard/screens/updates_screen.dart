import 'package:enjoy_television/common/drawer/drawer_widget.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../common/tv_app_bar.dart';
import '../../models/data_model.dart';
import '../../news/news_provider.dart';

class UpdatesScreen extends ConsumerWidget {
  const UpdatesScreen({super.key});
  final bool threeItems = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataModelNotifierProvider('mob_updates.php'));
    final newsData = ref.watch(newsNotifierProvider);

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: const TVAppBar(),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            data.when(
              data: (data) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: threeItems ? 3 : 2,
                    childAspectRatio: threeItems ? 0.55 : 0.75,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () =>
                            context.goNamed('play-video', queryParameters: {
                              'pageTitle': 'Updates',
                              'title': data[index].title,
                              'pageUrl': data[index].pagePath,
                              'videoUrl': data[index].videoUrl,
                              'date': data[index].date ?? '',
                              'phpPath': 'path',
                              'imageUrl': data[index].imageUrl,
                              'isFavorite': 'true',
                            }),
                        child: UpdatesCard(data: data[index]));
                  },
                );
              },
              loading: () => const Center(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 1900, top: 200),
                child: CircularProgressIndicator(),
              )),
              error: (error, stack) => Center(child: Text(error.toString())),
            ),
            newsData.when(
              data: (newsData) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: threeItems ? 3 : 2,
                    childAspectRatio: threeItems ? 0.55 : 0.75,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: newsData.length > 3 ? 3 : newsData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => context.pushNamed('news-read-screen',
                                queryParameters: {
                                  'id': newsData[index].id,
                                  'title': newsData[index].title,
                                  'content': newsData[index].htmlContent ?? '',
                                  'date': newsData[index].date ?? '',
                                  'pagePath': newsData[index].pagePath ?? '',
                                }),
                        child: UpdatesCard(
                            data: DataModel(
                                title: newsData[index].title,
                                imageUrl: newsData[index].image!,
                                videoUrl: '',
                                category: 'NEWS',
                                date: DateFormat('dd MMMM yyyy').format(
                                    DateTime.parse(newsData[index].date!)))));
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text(error.toString())),
            ),
          ],
        ),
      ),
    );
  }
}

// ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               physics: const NeverScrollableScrollPhysics(),
//               children: newsData.when(
//                   data: (newsList) {
//                     return newsList
//                         .map((newsItem) => UpdatesCard(
//                               data: DataModel(
//                                   title: newsItem.title,
//                                   imageUrl: newsItem.image!,
//                                   videoUrl: '',
//                                   date: newsItem.date),
//                             ))
//                         .toList();
//                   },
//                   loading: () => [const SizedBox()],
//                   error: (error, stack) => [
//                         Center(child: Text(error.toString())),
//                       ]),
//             ),

class UpdatesCard extends StatelessWidget {
  const UpdatesCard({super.key, required this.data});
  final bool threeItems = true;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Hero(
            tag: data.videoUrl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    data.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: threeItems ? 2 : 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(data.title,
                      style: threeItems
                          ? Theme.of(context).textTheme.titleSmall
                          : Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: threeItems ? 2 : 8),
                  child: Text((data.category)?.toUpperCase() ?? '',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.blue,
                            fontSize: threeItems ? 10 : null,
                          )),
                ),
                SizedBox(height: threeItems ? 4 : 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(data.date ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.greyColor
                            .copyWith(
                              fontSize: threeItems ? 9 : null,
                            )),
                    SizedBox(width: threeItems ? 7 : 10),
                  ],
                ),
                SizedBox(height: threeItems ? 22 : 28),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              height: threeItems ? 18 : 25,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text('Newly Added',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white, fontSize: threeItems ? 10 : null)),
            ),
          )
        ],
      ),
    );
  }
}
