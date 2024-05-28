import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewTVWidget extends StatefulWidget {
  const NewTVWidget({super.key, required this.isFullScreen});
  final bool isFullScreen;

  @override
  State<NewTVWidget> createState() => _NewTVWidgetState();
}

class _NewTVWidgetState extends State<NewTVWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / (widget.isFullScreen ? 8 : 9),
        child: const MyWebView());
  }
}

class MyWebView extends StatelessWidget {
  const MyWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: WebView(
        initialUrl: 'https://players.fluidstream.it/EnjoyTelevision/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
