import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:flutter_complete_guide/screens/EditProductScreen.dart';
import 'package:flutter_complete_guide/widgets/AppDrawer.dart';
import 'package:flutter_complete_guide/widgets/UserProductItem.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-products";
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    return (Scaffold(
      appBar: AppBar(
        title: Text("Manage Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) => UserProductItem(
              id: productsData.items[i].id,
              title: productsData.items[i].title,
              imageUrl: productsData.items[i].imageUrl,
            ),
            itemCount: productsData.items.length,
          )),
    ));
  }
}
