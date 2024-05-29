import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/image_path.dart';
import '../notifications/notify_help.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset('assets/icons/logo.png', height: 50),
          const SizedBox(height: 20),
          const Text('NOTIFICATIONS'),
          ListTile(
            title: const Text('Push Notifications'),
            leading: const Icon(Icons.notifications_active_outlined),
            trailing: FutureBuilder<bool>(
              future: NotificationHelper().checkNotification(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(color: Colors.red);
                }
                return Switch(
                  value: snapshot.data ?? false,
                  onChanged: (value) {
                    if (value) {
                      NotificationHelper().periodicNotification();
                    } else {
                      NotificationHelper().cancelAll();
                    }
                    setState(() {});
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text('OUR SOCIALS'),
          ...ImagePath.socialList.map((social) {
            return ListTile(
              title: Text(social.text),
              leading: Image.asset(social.imagePath, height: 30),
              onTap: () {
                launchUrl(Uri.parse(social.url));
              },
            );
          }),
          const SizedBox(height: 20),
          const Text('HELP & PRIVACY'),
          ListTile(
            title: const Text('Help'),
            leading: const Icon(Icons.help_outline),
            onTap: () {
              final url = Uri.parse(
                  "mailto:info@enjoytelevision.com?subject=Help for Mobile app Team&body=${Uri.encodeComponent('')}");
              launchUrl(url, webOnlyWindowName: '_self');
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {
              final url =
                  Uri.parse('https://enjoytelevision.com/privacy_policy.html');
              launchUrl(url);
            },
          ),
        ],
      ),
    );
  }
}
