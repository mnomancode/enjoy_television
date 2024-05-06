import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalListViewLoading extends StatelessWidget {
  const HorizontalListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF191919),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).cardColor,
                    highlightColor:
                        Theme.of(context).cardColor.withOpacity(0.1),
                    child: Container(
                      width: 200,
                      height: 115,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).cardColor,
                    highlightColor:
                        Theme.of(context).cardColor.withOpacity(0.1),
                    period: const Duration(milliseconds: 800),
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).cardColor,
                    highlightColor:
                        Theme.of(context).cardColor.withOpacity(0.1),
                    period: const Duration(milliseconds: 800),
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
