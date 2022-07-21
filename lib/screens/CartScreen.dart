import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/CartProvider.dart'
    show CartProvider;
import 'package:flutter_complete_guide/providers/OrderProvider.dart';
import 'package:flutter_complete_guide/widgets/CartItem.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final String routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return (Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmout}",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      onPressed: () {
                        Provider.of<OrderProvider>(context, listen: false).addOrder(
                            cart.items.values.toList(), cart.totalAmout);
                        cart.clear();
                      },
                      child: Text("Order Now"))
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, i) => CartItem(
              id: cart.items.values.toList()[i].id,
              prodId: cart.items.keys.toList()[i],
              price: cart.items.values.toList()[i].price,
              quantity: cart.items.values.toList()[i].quantity,
              title: cart.items.values.toList()[i].title),
          itemCount: cart.items.length,
        )),
      ]),
    ));
  }
}
