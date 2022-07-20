import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/ProductsData.dart';
import 'package:flutter_complete_guide/providers/Product.dart';
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:flutter_complete_guide/widgets/ProductItem.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
//   final List<Product> products = DummyProducts;

  bool showFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showFavorites ? productsData.getFavorites() : productsData.items;

    return (Scaffold(
      appBar: AppBar(
        title: Text("KShop"),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites)
                    showFavorites = true;
                  else
                    showFavorites = false;
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text("Show Favorites"),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOptions.All,
                    )
                  ]),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        // itemBuilder: (ctx, index) {
        //   return (
        // 	ProductItem(
        //     product: products[index],
        //   ));
        // },
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        ),
        itemCount: products.length,
      ),
    ));
  }
}
