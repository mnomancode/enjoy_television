import 'package:enjoy_television/dashboard/providers/index_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/home_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      Center(child: Text('Genre')),
      Center(child: Text('Favorite')),
      Center(child: Text('Updates')),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBar = ref.watch(bottomBarNotifierProvider);
    return Scaffold(
      body: _buildScreens()[bottomBar.currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10),
          ],
        ),
        height: 80,
        child: Row(
            children:
                bottomBar.items.map((item) => BottomBatItem(item)).toList()),
      ),
    );
  }
}

class BottomBatItem extends ConsumerWidget {
  const BottomBatItem(this.navItem, {super.key});

  final MyNavItem navItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarNotifier = ref.read(bottomBarNotifierProvider.notifier);
    final bottomBar = ref.watch(bottomBarNotifierProvider);

    return Expanded(
      child: InkWell(
        onTap: () {
          bottomBarNotifier.updateCurrentIndex(navItem.index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              height: 40,
              width: bottomBar.currentIndex == navItem.index ? 70 : 40,
              decoration: BoxDecoration(
                color: bottomBar.currentIndex == navItem.index
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: bottomBar.currentIndex == navItem.index
                  ? navItem.selectedIcon
                  : navItem.unselectedIcon,
            ),
            const SizedBox(height: 5),
            Text(
              navItem.label,
              style: bottomBar.currentIndex == navItem.index
                  ? Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white.withOpacity(0.8))
                  : Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .color!
                          .withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
