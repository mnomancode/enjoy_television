import 'package:cached_network_image/cached_network_image.dart';
import 'package:enjoy_television/constants/image_path.dart';
import 'package:enjoy_television/loading_widgets/app_shimmer.dart';
import 'package:enjoy_television/loading_widgets/grid_videos_loading.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../loading_widgets/sliver_grid_loading.dart';
import '../models/data_model.dart';

class GenreVideosScreen extends ConsumerWidget {
  const GenreVideosScreen({super.key, required this.genre});
  final Genre genre;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataModelNotifierProvider(genre.phpPath));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(genre.name,
                  style: Theme.of(context).textTheme.titleLarge),
              background: Stack(
                children: [
                  Image.asset(genre.imagePath, fit: BoxFit.contain),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.1),
                        ],
                        stops: const [0.3, 0.9],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.all(10)),
          SliverToBoxAdapter(
              child: Text('    Videos',
                  style: Theme.of(context).textTheme.titleLarge)),
          const SliverPadding(padding: EdgeInsets.all(5)),
          data.when(
            data: (videos) {
              return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return data.when(
                      data: (videos) {
                        return GestureDetector(
                          onTap: () {
                            context.goNamed('play-video', queryParameters: {
                              'pageTitle': genre.name,
                              'title': videos[index].title,
                              'pageUrl': videos[index].pagePath,
                              'videoUrl': videos[index].videoUrl,
                              'date': videos[index].date ?? '',
                              'phpPath': genre.phpPath,
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: index.isEven ? 15 : 0,
                                right: index.isEven ? 0 : 15),
                            child: Card(
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
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        width: 200,
                                        height: 100,
                                        fit: BoxFit.cover,
                                        imageUrl: videos[index].imageUrl,
                                        placeholder: (context, url) =>
                                            const AppShimmer(borderRadius: 0),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          7, 5, 20, 0),
                                      child: Text(
                                        videos[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    const Spacer(),
                                    if (videos[index].date != null)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                7, 5, 10, 10),
                                            child: Text(
                                              videos[index].date!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.greyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      loading: () => const GridVideosLoading(),
                      error: (error, _) => Text('Error: $error'),
                    );
                  },
                  itemCount: data.maybeWhen(
                    data: (videos) => videos.length,
                    orElse: () => 0,
                  ));
            },
            loading: () => const SliverGridVideosLoading(),
            error: (error, _) => SliverToBoxAdapter(
                child: Text('Error: $error',
                    style: Theme.of(context).textTheme.titleLarge)),
          )
        ],
      ),
    );
  }
}

class SliverAnimatedGridSample extends StatefulWidget {
  const SliverAnimatedGridSample({super.key});

  @override
  State<SliverAnimatedGridSample> createState() =>
      _SliverAnimatedGridSampleState();
}

class _SliverAnimatedGridSampleState extends State<SliverAnimatedGridSample> {
  final GlobalKey<SliverAnimatedGridState> _listKey =
      GlobalKey<SliverAnimatedGridState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late ListModel<int> _list;
  int? _selectedItem;
  late int
      _nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2, 3, 4, 5],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 6;
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This
  // method is needed because a removed item remains visible until its
  // animation has completed (even though it's gone as far this ListModel is
  // concerned). The widget will be used by the
  // [AnimatedGridState.removeItem] method's
  // [AnimatedGridRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      removing: true,
      item: item,
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
    } else {
      _list.removeAt(_list.length - 1);
    }
    setState(() {
      _selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text(
                'SliverAnimatedGrid',
                style: TextStyle(fontSize: 30),
              ),
              expandedHeight: 60,
              centerTitle: true,
              backgroundColor: Colors.amber[900],
              leading: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: _remove,
                tooltip:
                    'Remove the selected item, or the last item if none selected.',
                iconSize: 32,
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: _insert,
                  tooltip: 'Insert a new item.',
                  iconSize: 32,
                ),
              ],
            ),
            SliverAnimatedGrid(
              key: _listKey,
              initialItemCount: _list.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: _buildItem,
            ),
          ],
        ),
      ),
    );
  }
}

typedef RemovedItemBuilder = Widget Function(
    int item, BuildContext context, Animation<double> animation);

// Keeps a Dart [List] in sync with an [AnimatedGrid].
//
// The [insert] and [removeAt] methods apply to both the internal list and
// the animated list that belongs to [listKey].
//
// This class only exposes as much of the Dart List API as is needed by the
// sample app. More list methods are easily added, however methods that
// mutate the list must make the same changes to the animated list in terms
// of [AnimatedGridState.insertItem] and [AnimatedGrid.removeItem].
class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<SliverAnimatedGridState> listKey;
  final RemovedItemBuilder removedItemBuilder;
  final List<E> _items;

  SliverAnimatedGridState get _animatedGrid => listKey.currentState!;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedGrid.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedGrid.removeItem(
        index,
        (BuildContext context, Animation<double> animation) =>
            removedItemBuilder(index, context, animation),
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

// Displays its integer item as 'Item N' on a Card whose color is based on
// the item's value.
//
// The card turns gray when [selected] is true. This widget's height
// is based on the [animation] parameter. It varies as the animation value
// transitions from 0.0 to 1.0.
class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    this.removing = false,
    required this.animation,
    required this.item,
  }) : assert(item >= 0);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;
  final bool removing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 2.0,
      ),
      child: ScaleTransition(
        scale: CurvedAnimation(
            parent: animation,
            curve: removing ? Curves.easeInOut : Curves.bounceOut),
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: selected
                  ? Colors.black12
                  : Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text(
                  (item + 1).toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
