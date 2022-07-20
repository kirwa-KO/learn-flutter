import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/Product.dart';
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-details";

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;

    final Product product = Provider.of<ProductsProvider>(context).findById(productId);
    return (Scaffold(
      appBar: AppBar(title: Text(product.title)),
    ));
  }
}
