import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewTVWidget extends StatefulWidget {
  const NewTVWidget({super.key});

  @override
  State<NewTVWidget> createState() => _NewTVWidgetState();
}

class _NewTVWidgetState extends State<NewTVWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          const MyWebView(),
          Positioned(
            right: 5,
            bottom: 5,
            child: IconButton(
                onPressed: () {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.landscapeLeft]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWebView()),
                  ).then((value) {
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
                  });
                },
                icon: const Opacity(
                  opacity: 0,
                  child: Icon(Icons.fullscreen, color: Colors.white, size: 30),
                )),
          )
        ],
      ),
    );
  }
}

RouteSettings rotationSettings(RouteSettings settings, Orientation rotation) {
  return RouteSettings(name: settings.name, arguments: rotation);
}

class MyWebView extends StatelessWidget {
  const MyWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SizedBox(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.width,
          child: const WebView(
            initialUrl: 'https://players.fluidstream.it/EnjoyTelevision/',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        );
      },
    );
  }
}
