import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewTVWidget extends StatelessWidget {
  const NewTVWidget({super.key, required this.isFullScreen});
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: isFullScreen ? 16 / 7.3 : 16 / 9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isFullScreen ? 80 : 0),
        child: MyWebView(isFullScreen: isFullScreen),
      ),
    );
  }
}

class MyWebView extends StatelessWidget {
  const MyWebView({super.key, required this.isFullScreen});
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: WebView(
        backgroundColor: Colors.transparent,
        initialUrl: 'https://players.fluidstream.it/EnjoyTelevision/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
