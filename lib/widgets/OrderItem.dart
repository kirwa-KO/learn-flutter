import 'dart:math';

import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../providers/OrderProvider.dart" as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  const OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text("\$${this.widget.order.amout}"),
          subtitle: Text(
            DateFormat("dd/MM/yyyy hh:mm").format(this.widget.order.dateTime),
          ),
          trailing: IconButton(
            icon: Icon(this._expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                this._expanded = !this._expanded;
              });
            },
          ),
        ),
        if (this._expanded)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.order.products.length * 20.0 + 10, 100),
            child: ListView(
              children: widget.order.products
                  .map((prod) => Container(
					margin: EdgeInsets.symmetric(vertical: 4),
					child: Row(
						  mainAxisAlignment: MainAxisAlignment.spaceBetween,
						  children: [
							Text(
							  prod.title,
							  style: TextStyle(
								fontSize: 18,
								fontWeight: FontWeight.bold,
							  ),
							),
							Text(
							  "${prod.quantity}x \$${prod.price}",
							  style: TextStyle(
								fontSize: 18,
											  color: Colors.grey
							  ),
							),
						  ],
						),
				  ))
                  .toList(),
            ),
          )
      ]),
    );
  }
}
