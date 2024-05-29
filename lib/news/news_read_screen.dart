import 'package:enjoy_television/news/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:share_plus/share_plus.dart';

import '../common/favourite_widget.dart';

class NewsReadScreen extends StatelessWidget {
  const NewsReadScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.image,
      required this.content,
      required this.date,
      required this.pagePath});
  final String id;
  final String title;
  final String image;
  final String content;
  final String date;
  final String pagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          FavoriteWidget(
            id,
            null,
            News(
                id: id,
                title: title,
                htmlContent: content,
                date: date,
                image: image,
                pagePath: pagePath),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share('Check out this news: $title \n\n$pagePath');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: HtmlWidget(content))),
    );
  }
}
