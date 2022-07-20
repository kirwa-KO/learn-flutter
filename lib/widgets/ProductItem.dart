import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/Product.dart';
import 'package:flutter_complete_guide/screens/ProductDetailsScreen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
//   final Product product;

//   ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailsScreen.routeName,
            arguments: product.id,
          );
        },
        child: (GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
                builder: ((context, value, child) => IconButton(
                      icon: product.isFavorite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      onPressed: product.toggleFavorites,
                    ))),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        )));
  }
}
