import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          drawer: const Drawer(),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: true,
                forceElevated: false,
                excludeHeaderSemantics: true,
                elevation: 1,
                expandedHeight: 120.0,
                title: Image.asset('assets/icons/logo.png', height: 50),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    tooltip: 'Add new entry',
                    onPressed: () {/* ... */},
                  ),
                ],
                // bottom: const TabBar(
                //   tabs: [
                //     Tab(text: "TAB1"),
                //     Tab(text: "TAB2"),
                //   ],
                // ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    SizedBox(
                      height: 1000,
                      child: TabBarView(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
