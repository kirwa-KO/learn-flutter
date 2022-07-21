import 'package:flutter/material.dart';
import './CartProvider.dart';

class OrderItem {
  final String id;
  final double amout;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {@required this.id,
      @required this.amout,
      @required this.products,
      @required this.dateTime});
}

class OrderProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amout: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
