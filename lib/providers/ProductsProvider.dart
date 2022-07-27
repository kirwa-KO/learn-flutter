import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/ProductsData.dart';
import 'package:flutter_complete_guide/providers/Product.dart';
import 'package:http/http.dart' as http;

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

  Future<void> addProduct(Product product) {
    var url = Uri.parse(
        "https://flutter-shop-5e4a2-default-rtdb.firebaseio.com/products.json");
    // print(url);
    return http
        .post(
      url,
      body: json.encode({
        "title": product.title,
        "description": product.description,
        "price": product.price,
        "imageUrl": product.imageUrl,
        "isFavorite": product.isFavorite
      }),
    )
        .then((res) {
      print(json.decode(res.body)["name"]);
      _items.add(Product(
          id: json.decode(res.body)["name"],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl));
      notifyListeners();
    });
  }

  void updareProduct(String prodId, Product product) {
    final prodIndex = _items.indexWhere((prod) => prod.id == prodId);
    if (prodIndex != -1) {
      _items[prodIndex] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String prodId) {
    _items.removeWhere((prod) => prod.id == prodId);
    notifyListeners();
  }
}
