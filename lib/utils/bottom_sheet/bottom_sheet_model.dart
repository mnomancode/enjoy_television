import 'package:flutter/material.dart';

class BottomSheetModal extends StatelessWidget {
  final Widget child;
  final Widget? bottomAppBarChild;
  final String? headline;
  final bool isBottomFixed;
  final bool resizeToAvoidBottomInset;
  final double? heightFactor;

  const BottomSheetModal(
      {super.key,
      required this.child,
      this.headline,
      this.isBottomFixed = false,
      this.bottomAppBarChild,
      this.heightFactor,
      this.resizeToAvoidBottomInset = false});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor ?? 0.4,
      child: GestureDetector(
          onTap: () {
            // SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: const BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Spacer(),
                      if (headline != null) Text(headline!),
                      const Spacer(),
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close, size: 35)),
                    ],
                  ),
                ),
                isBottomFixed
                    ? Expanded(child: child)
                    : Expanded(child: SingleChildScrollView(child: child)),
              ],
            ),
          )),
    );
  }
}
