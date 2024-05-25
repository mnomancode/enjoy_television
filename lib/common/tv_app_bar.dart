import 'package:flutter/material.dart';

class TVAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TVAppBar({super.key, this.title, this.showSearch = false});
  final String? title;
  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset('assets/icons/logo.png', height: 50),
          const SizedBox(width: 10),
          if (title != null)
            Text(title!, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      actions: !showSearch
          ? null
          : [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
