import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/news/news_provider.dart';
import 'package:enjoy_television/themes/theme.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'favourite_widget.dart';

import '../loading_widgets/app_shimmer.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem(
      {super.key, required this.newsItem, this.isFavorite = false});
  final News newsItem;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () => context.pushNamed('news-read-screen', queryParameters: {
            'id': newsItem.id,
            'title': newsItem.title,
            'content': newsItem.htmlContent ?? '',
            'date': newsItem.date ?? '',
            'pagePath': newsItem.pagePath ?? '',
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
                      imageUrl: newsItem.image ?? '',
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
                          width: MediaQuery.of(context).size.width - 180,
                          child: Text(newsItem.title,
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (isFavorite)
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      const Icon(Icons.calendar_today_outlined,
                                          color: Colors.grey, size: 15),
                                      const SizedBox(width: 5),
                                      Text(
                                        DateFormat('dd MMMM yyyy').format(
                                            DateTime.tryParse(
                                                    newsItem.date ?? '') ??
                                                DateTime.now()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.greyColor,
                                      ),
                                    ],
                                  ),
                            if (newsItem.readTime != null) ...[
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  const Icon(Icons.menu_book_outlined,
                                      size: 15, color: Colors.grey),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${newsItem.readTime ?? ''} min read',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.greyColor,
                                  ),
                                ],
                              ),
                            ],
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
        Positioned(
            top: 20,
            right: 20,
            child: FavoriteWidget(newsItem.id, null, newsItem)),
      ],
    );
  }
}
