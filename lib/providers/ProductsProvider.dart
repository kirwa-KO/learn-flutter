import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/ProductsData.dart';
import 'package:flutter_complete_guide/providers/Product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = DummyProducts;

  List<Product> get items {
    return [..._items];
  }

  List<Product> getFavorites() {
    return _items.where((item) => item.isFavorite == true).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
