import 'package:enjoy_television/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/bottom_sheet/bottom_sheet_functions.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('assets/icons/logo.png', height: 70),
          ),
          const Divider(height: 40),
          ListTile(
              title: const Text('Share App', style: TextStyle(fontSize: 16)),
              leading: const Icon(Icons.share),
              onTap: () {
                Navigator.of(context).pop();
                Share.share(ImagePath.shareAppText);
              }),
          ListTile(
            title: const Text('Feedback', style: TextStyle(fontSize: 16)),
            leading: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context).pop();
              final url = Uri.parse(
                  "mailto:info@enjoytelevision.com?subject=FeedBack for Mobile app Team&body=${Uri.encodeComponent('')}");
              launchUrl(url, webOnlyWindowName: '_self');
            },
          ),
          ListTile(
              title: const Text('Contact Us', style: TextStyle(fontSize: 16)),
              leading: const Icon(Icons.email_outlined),
              onTap: () {
                Navigator.of(context).pop();
                pushContactUSBottomSheet(context);
              }),
          const Divider(height: 40),
          ListTile(
              title: const Text('Settings', style: TextStyle(fontSize: 16)),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                context.goNamed('settings-screen');
              }),
        ],
      ),
    );
  }
}
