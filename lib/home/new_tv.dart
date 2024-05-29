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
    return widget.isFullScreen
        ? Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 70),
            child: const MyWebView(),
          )
        : AspectRatio(
            aspectRatio:
                (widget.isFullScreen ? 2 : 16) / (widget.isFullScreen ? 1 : 9),
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
