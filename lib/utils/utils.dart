import 'dart:developer';

import 'package:enjoy_television/api/dio_client.dart';
import 'package:enjoy_television/extensions/string_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../search/repository/search_impl.dart';

class AppUtils {
  static List<Map<String, dynamic>>? extractData(String path, data) {
    switch (path) {
      case 'djset.php' || 'festivals.php':
        return _getDataFromHtmlDjset(data);

      // case 'video.php':
      //   return _getVideosData(data);

      default:
        return _getDataFromHtmlDjset(data);
    }
  }

// video.php
  static List<Map<String, dynamic>> _getVideosData(String text) {
    RegExp urlRegex = RegExp(r'(https?://\S+)');
    RegExp postNameRegex = RegExp(r'<post_name>(.*?)</post_name>');
    RegExp dateRegex = RegExp(
        r'\b[a-zA-Z]{3}, \d{2} \b[a-zA-Z]{3} \d{4} \d{2}:\d{2}:\d{2} \+\d{4}');
    RegExp imageUrlRegex = RegExp(r'(https?://\S+\.(?:png|jpg|jpeg))');

    List<Map<String, String>> extractedData = [];

    Iterable<RegExpMatch> urlMatches = urlRegex.allMatches(text);
    Iterable<RegExpMatch> postNameMatches = postNameRegex.allMatches(text);
    Iterable<RegExpMatch> dateMatches = dateRegex.allMatches(text);
    Iterable<RegExpMatch> imageUrlMatches = imageUrlRegex.allMatches(text);

    Iterator<RegExpMatch> urlIterator = urlMatches.iterator;
    Iterator<RegExpMatch> postNameIterator = postNameMatches.iterator;
    Iterator<RegExpMatch> dateIterator = dateMatches.iterator;
    Iterator<RegExpMatch> imageUrlIterator = imageUrlMatches.iterator;

    while (urlIterator.moveNext() &&
        postNameIterator.moveNext() &&
        dateIterator.moveNext() &&
        imageUrlIterator.moveNext()) {
      String postName = postNameIterator.current.group(1)!;
      postName = postName.replaceAll('-', ' ');
      postName = postName.split(' ').map((word) {
        return word[0].toUpperCase() + word.substring(1);
      }).join(' ');

      extractedData.add({
        'videoUrl': urlIterator.current.group(0)!,
        'title': postName,
        'date': dateIterator.current.group(0)!,
        'imageUrl': imageUrlIterator.current.group(0)!,
      });
    }
    return extractedData;
  }

// djset.php
  static List<Map<String, dynamic>>? _getDataFromHtmlDjset(String html) {
    List<Map<String, dynamic>> extractedData = [];

    var document = parse(html);

    var immagine = document.querySelectorAll('.immagine');

    for (var item in immagine) {
      var aHref = item.querySelector('a')?.attributes['href'];
      var imagePath = item.attributes['style'];
      var h2Text = item.nextElementSibling?.text;
      var date = item.nextElementSibling?.nextElementSibling?.text;
      var postLink = item
          .nextElementSibling?.nextElementSibling?.nextElementSibling
          ?.querySelector('a')
          ?.attributes['href'];

      var category =
          item.nextElementSibling?.nextElementSibling?.nextElementSibling?.text;

      extractedData.add({
        'videoUrl': aHref.toString(),
        'imageUrl': imagePath!.matchRegExp(r"url\('([^']*)'\)"),
        'title': h2Text.toString(),
        'date': date,
        'pagePath': postLink,
        'category': category,
      });
    }

    return extractedData;
  }

  static List<Map<String, dynamic>>? extractNews(item) {
    List<Map<String, dynamic>> extractedData = [];

    for (var item in item) {
      extractedData.add({
        'id': item['id'],
        'title': item['title']['rendered'],
        'date': item['date'],
        'pagePath': item['yoast_head_json']['og_url'],
        'htmlContent': item['content']['rendered'],
        'image': item['yoast_head_json']['og_image'][0]['url'],
        'readTime': item['yoast_head_json']['twitter_misc']
            ['Est. reading time'],
      });
    }

    return extractedData;
  }

  static SearchResult? parseSearchResult(html) {
    var document = parse(html);

// get element by id
    var itemsListBox = document.getElementById('proradio-loop');
    List items = itemsListBox?.children.toList() ?? [];
    List<VideoItem> videosList = [];

    if (items.isEmpty) {
      return null;
    }

    items.removeLast();
    for (var element in items) {
      var title = element.querySelector('h3')?.text ?? '';

      var postUrl = element.querySelector('a')?.attributes['href'];
      var date = element.querySelector('a')?.text;

      videosList.add(VideoItem(
        title: title.toString(),
        date: date.toString(),
        postUrl: postUrl.toString(),
      ));
    }
    int totalPages = 1;

    try {
      var pageString = document.getElementsByClassName(
          'proradio-num proradio-btn  proradio-btn__r proradio-card ');
      totalPages = int.tryParse(pageString.last.text) ?? 1;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return SearchResult(
        title: 'Search Results',
        data: videosList,
        totalPages: totalPages,
        pageString: '');
  }

  Future<String?> getVideoUrl(String postUrl) async {
    DioClient dioClient = DioClient();
    final response = await dioClient.getVideoUrl(postUrl);
    var document = parse(response.data);
    //
    var element = document.getElementsByClassName(
        'proradio-col proradio-s12 proradio-m12 proradio-l9');
    var videoUrl = element.first.querySelector('iframe')?.attributes['src'];
    videoUrl = videoUrl?.split('?')[0];

    return YoutubePlayer.convertUrlToId(videoUrl!);
  }
}
