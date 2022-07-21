import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/OrderProvider.dart'
    show OrderProvider;
import 'package:flutter_complete_guide/widgets/AppDrawer.dart';
import 'package:flutter_complete_guide/widgets/OrderItem.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = "/order";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
	  drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
