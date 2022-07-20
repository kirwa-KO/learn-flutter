import 'package:flutter/material.dart';

class _CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  _CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, _CartItem> _items = {};

  Map<String, _CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmout {
    double total = 0.0;

    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String prodId, double price, String title) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingItem) => _CartItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: existingItem.price));
    } else {
      _items.putIfAbsent(prodId,
          () => _CartItem(id: prodId, title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }
}
