import 'package:flutter/material.dart';

class NewTransition extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  final Function _submitTransition;

  NewTransition(this._submitTransition);

  Widget build(BuildContext ctx) {
    return (Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleControler,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountControler,
          ),
          ElevatedButton(
            onPressed: () {
              this._submitTransition(titleControler.text, double.parse(amountControler.text));
            },
            child: Text("Add Transition"),
            style: ElevatedButton.styleFrom(primary: Colors.orange),
          )
        ]),
      ),
    ));
  }
}
