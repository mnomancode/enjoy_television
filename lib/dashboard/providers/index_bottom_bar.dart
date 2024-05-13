import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'index_bottom_bar.freezed.dart';
part 'index_bottom_bar.g.dart';

@riverpod
class BottomBarNotifier extends _$BottomBarNotifier {
  @override
  BottomBar build() => BottomBar(
        currentIndex: 0,
        items: [
          MyNavItem(
            index: 0,
            selectedIcon: Icon(CupertinoIcons.house_fill,
                color: Colors.red.withOpacity(0.7)),
            unselectedIcon: const Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          MyNavItem(
            index: 1,
            selectedIcon: Icon(CupertinoIcons.square_list_fill,
                color: Colors.red.withOpacity(0.7)),
            unselectedIcon: const Icon(CupertinoIcons.square_list),
            label: 'Genre',
          ),
          MyNavItem(
            index: 2,
            selectedIcon: Icon(CupertinoIcons.heart_fill,
                color: Colors.red.withOpacity(0.7)),
            unselectedIcon: const Icon(CupertinoIcons.heart),
            label: 'Favorite',
          ),
          MyNavItem(
            index: 3,
            selectedIcon: Icon(CupertinoIcons.bell_fill,
                color: Colors.red.withOpacity(0.7)),
            unselectedIcon: const Icon(CupertinoIcons.bell),
            label: 'Updates',
          ),
        ],
      );

  void updateCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

@freezed
class BottomBar with _$BottomBar {
  const factory BottomBar({
    required int currentIndex,
    required List<MyNavItem> items,
  }) = _BottomBar;
}

class MyNavItem {
  final int index;
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final String label;

  MyNavItem({
    required this.index,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });
}
