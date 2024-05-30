import 'dart:developer';

import 'package:enjoy_television/connectivity/payment_check.dart';
import 'package:enjoy_television/dashboard/providers/index_bottom_bar.dart';
import 'package:enjoy_television/genre/genre_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifications/notify_help.dart';
import 'favorites_screen.dart';
import '../../home/home_screen.dart';
import '../../utils/payment_error.dart';
import 'updates_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      GenreScreen(),
      FavoritesScreen(),
      UpdatesScreen(),
    ];
  }

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    gotoUpdatesScreen(ref);

    super.initState();
  }

  gotoUpdatesScreen(WidgetRef ref) async {
    final notificationData = await notificationHelper.initializeNotification();
    if (notificationData != null) {
      log('notificationData: ${notificationData.didNotificationLaunchApp}');
      if (notificationData.didNotificationLaunchApp) {
        ref.read(bottomBarNotifierProvider.notifier).updateCurrentIndex(3);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomBar = ref.watch(bottomBarNotifierProvider);
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isFullScreen = orientation == Orientation.landscape;

        return PopScope(
          canPop: !isFullScreen,
          onPopInvoked: (didPop) {
            log('didPop: $didPop');
            if (didPop) {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
            }
          },
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            body: Stack(
              alignment: Alignment.center,
              children: [
                widget._buildScreens()[bottomBar.currentIndex],
                FutureBuilder(
                  future:
                      ref.watch(paymentStatusNotifierProvider.notifier).build(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data?.paymentDone ?? true) {
                        return Container();
                      } else {
                        return NoPayment(message: snapshot.data?.message);
                      }
                    }
                    return Container();
                  },
                ),
              ],
            ),
            bottomNavigationBar: isFullScreen
                ? null
                : Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 1,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10),
                      ],
                    ),
                    height: 80,
                    child: Row(
                        children: bottomBar.items
                            .map((item) => BottomBatItem(item))
                            .toList()),
                  ),
          ),
        );
      },
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
                    ? Colors.red.withOpacity(0.06)
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
