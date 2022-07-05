import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import '../models/Transition.dart';

class TransitionList extends StatelessWidget {
  final List<Transition> trans;
  TransitionList(this.trans);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: (Column(
        children: this.trans.map((tran) {
          return (Card(
            child: Row(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 1)),
                child: Text('\$${tran.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.orange)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tran.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tran.date),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              )
            ]),
          ));
        }).toList(),
      )),
    );
  }
}
