import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/drawer/drawer_widget.dart';
import '../constants/image_path.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text('Genre',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24)),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: ImagePath.genreList.length,
          itemBuilder: (context, index) {
            final genre = ImagePath.genreList[index];

            return InkWell(
              onTap: () {
                if (genre.name == 'News') {
                  context.goNamed('genre-news-screen');
                } else {
                  context.goNamed('genre-videos-screen', extra: genre);
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(genre.imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.1),
                          ], stops: const [
                            0.1,
                            0.9
                          ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(genre.name,
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
