import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/CategoryScreen.dart';
import 'package:flutter_complete_guide/screens/FavoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
        ),
		body: TabBarView(children: [
			CategoryScreen(),
			FavoriteScreen()
		],),
      ),
    ));
  }
}
