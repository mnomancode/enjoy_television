import 'package:enjoy_television/utils/bottom_sheet/bottom_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsSheet extends StatelessWidget {
  const ContactUsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetModal(
        heightFactor: 0.5,
        child: Column(
          children: [
            Image.asset('assets/icons/logo.png', height: 90),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                final url = Uri.parse(
                    "mailto:info@enjoytelevision.com?subject=FeedBack for Mobile app Team&body=${Uri.encodeComponent('')}");
                launchUrl(url, webOnlyWindowName: '_self');
              },
              child: Text(
                'info@enjoytelevision.com',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  final url = Uri.parse('https://enjoytelevision.com/');
                  launchUrl(url);
                },
                child: Text(
                  'enjoytelevision.com',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(decoration: TextDecoration.underline),
                )),
          ],
        ));
  }
}
