import 'package:flutter/material.dart';

class NewTransition extends StatefulWidget {
  final Function _submitTransition;

  NewTransition(this._submitTransition);

  @override
  State<NewTransition> createState() => _NewTransitionState();
}

class _NewTransitionState extends State<NewTransition> {
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  void submitTransition() {
    if (titleControler.text.length <= 0 ||
        double.parse(amountControler.text) < 0) return;
    this.widget._submitTransition(
        titleControler.text, double.parse(amountControler.text));
    Navigator.of(context).pop();
  }

  Widget build(BuildContext ctx) {
    return (Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleControler,
            onSubmitted: (_) => this.submitTransition(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountControler,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => this.submitTransition(),
          ),
          ElevatedButton(
            onPressed: submitTransition,
            child: Text("Add Transition"),
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          )
        ]),
      ),
    ));
  }
}
