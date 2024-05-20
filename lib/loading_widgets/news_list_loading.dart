import 'package:enjoy_television/loading_widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class NewsListViewLoading extends StatelessWidget {
  const NewsListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const AppShimmer(borderRadius: 10, height: 120, width: 120),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 120,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppShimmer(borderRadius: 5, height: 20, width: 30),
                      AppShimmer(borderRadius: 5, height: 30, width: 130),
                      AppShimmer(borderRadius: 5, height: 20, width: 70),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
