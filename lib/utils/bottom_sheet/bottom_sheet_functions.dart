import 'package:flutter/material.dart';

import 'widgets/contact_us_sheet.dart';

pushContactUSBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => const ContactUsSheet(),
    isScrollControlled: true,
  );
}
