import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/CartProvider.dart';
import 'package:flutter_complete_guide/providers/Product.dart';
import 'package:flutter_complete_guide/screens/ProductDetailsScreen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
//   final Product product;

//   ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final CartProvider cart = Provider.of<CartProvider>(context, listen: false);
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
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Added item to cart",
                    // textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ));
              },
            ),
          ),
        )));
  }
}
