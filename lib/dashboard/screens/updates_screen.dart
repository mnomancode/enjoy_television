import 'package:enjoy_television/common/drawer/drawer_widget.dart';
import 'package:enjoy_television/dashboard/providers/updates_provider.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../common/tv_app_bar.dart';
import '../../models/data_model.dart';

class UpdatesScreen extends ConsumerWidget {
  const UpdatesScreen({super.key});
  final bool threeItems = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updates = ref.watch(updatesNotifierProvider);

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: const TVAppBar(),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: updates.when(
          data: (updates) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: threeItems ? 3 : 2,
                childAspectRatio: threeItems ? 0.55 : 0.75,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: (updates.length > 9) ? 9 : updates.length,
              itemBuilder: (context, index) {
                var data = updates[index];

                return data.isNews
                    ? UpdatesCard(
                        data: DataModel(
                            id: data.id,
                            title: data.title,
                            imageUrl: data.image ?? '',
                            htmlContent: data.htmlContent ?? '',
                            pagePath: data.pagePath ?? '',
                            videoUrl: '',
                            category: 'NEWS',
                            date: DateFormat('dd MMMM yyyy')
                                .format(DateTime.parse(data.date!))))
                    : UpdatesCard(
                        data: DataModel(
                            title: data.title,
                            imageUrl: data.image ?? '',
                            videoUrl: data.videoUrl ?? '',
                            category: data.category ?? '',
                            date: DateFormat('dd MMMM yyyy')
                                .format(DateTime.parse(data.date!))));
              },
            );
          },
          loading: () => SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: const Center(
                  child: CircularProgressIndicator(color: Colors.red))),
          error: (error, stack) => Center(child: Text(error.toString())),
        ),

        // Column(
        //   children: [
        //     data.when(
        //       data: (data) {
        //         return GridView.builder(
        //           shrinkWrap: true,
        //           physics: const NeverScrollableScrollPhysics(),
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: threeItems ? 3 : 2,
        //             childAspectRatio: threeItems ? 0.55 : 0.75,
        //             crossAxisSpacing: 0,
        //             mainAxisSpacing: 0,
        //           ),
        //           itemCount: data.length,
        //           itemBuilder: (context, index) {
        //             return GestureDetector(
        //                 onTap: () =>
        //                     context.goNamed('play-video', queryParameters: {
        //                       'pageTitle': 'Updates',
        //                       'title': data[index].title,
        //                       'pageUrl': data[index].pagePath,
        //                       'videoUrl': data[index].videoUrl,
        //                       'date': data[index].date ?? '',
        //                       'phpPath': 'path',
        //                       'imageUrl': data[index].imageUrl,
        //                       'isFavorite': 'true',
        //                     }),
        //                 child: UpdatesCard(data: data[index]));
        //           },
        //         );
        //       },
        //       loading: () => const Center(
        //           child: Padding(
        //         padding: EdgeInsets.only(bottom: 1900, top: 200),
        //         child: CircularProgressIndicator(),
        //       )),
        //       error: (error, stack) => Center(child: Text(error.toString())),
        //     ),
        //     newsData.when(
        //       data: (newsData) {
        //         return GridView.builder(
        //           shrinkWrap: true,
        //           physics: const NeverScrollableScrollPhysics(),
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: threeItems ? 3 : 2,
        //             childAspectRatio: threeItems ? 0.55 : 0.75,
        //             crossAxisSpacing: 0,
        //             mainAxisSpacing: 0,
        //           ),
        //           itemCount: newsData.length > 3 ? 3 : newsData.length,
        //           itemBuilder: (context, index) {
        //             return GestureDetector(
        //                 onTap: () => context.pushNamed('news-read-screen',
        //                         queryParameters: {
        //                           'id': newsData[index].id,
        //                           'title': newsData[index].title,
        //                           'content': newsData[index].htmlContent ?? '',
        //                           'date': newsData[index].date ?? '',
        //                           'pagePath': newsData[index].pagePath ?? '',
        //                         }),
        //                 child: UpdatesCard(
        //                     data: DataModel(
        //                         title: newsData[index].title,
        //                         imageUrl: newsData[index].image!,
        //                         videoUrl: '',
        //                         category: 'NEWS',
        //                         date: DateFormat('dd MMMM yyyy').format(
        //                             DateTime.parse(newsData[index].date!)))));
        //           },
        //         );
        //       },
        //       loading: () => const Center(child: CircularProgressIndicator()),
        //       error: (error, stack) => Center(child: Text(error.toString())),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class UpdatesCard extends StatelessWidget {
  const UpdatesCard({super.key, required this.data});
  final bool threeItems = true;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.videoUrl.isNotEmpty) {
          context.goNamed('play-video', queryParameters: {
            'pageTitle': 'Updates',
            'title': data.title,
            'pageUrl': data.pagePath,
            'videoUrl': data.videoUrl,
            'date': data.date ?? '',
            'phpPath': 'path',
            'imageUrl': data.imageUrl,
            'isFavorite': 'true',
          });
        } else {
          context.pushNamed('news-read-screen', queryParameters: {
            'id': data.id,
            'title': data.title,
            'content': data.htmlContent ?? '',
            'date': data.date ?? '',
            'pagePath': data.pagePath ?? '',
            'image': data.imageUrl,
          });
        }
      },
      child: Card(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: threeItems ? 2 : 8),
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
      ),
    );
  }
}

class NewUpdatesItem {}
