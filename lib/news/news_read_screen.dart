import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NewsReadScreen extends StatelessWidget {
  const NewsReadScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.content,
      required this.date});
  final String id;
  final String title;
  final String content;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: HtmlWidget(content))),
    );
  }
}
