import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransition extends StatefulWidget {
  final Function _submitTransition;

  NewTransition(this._submitTransition);

  @override
  State<NewTransition> createState() => _NewTransitionState();
}

class _NewTransitionState extends State<NewTransition> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  DateTime _selectedDate;

  void submitTransition() {
    if (titleControler.text.length <= 0 ||
        amountControler.text.isEmpty || double.parse(amountControler.text) <= 0 || _selectedDate == null) return;
    this.widget._submitTransition(
        titleControler.text, double.parse(amountControler.text), _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
	  child: (Card(
		child: Container(
		  padding: EdgeInsets.only(
				top: 10,
				left: 10,
				right: 10,
				bottom: MediaQuery.of(context).viewInsets.bottom + 10
			),
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
			Container(
			  height: 70,
			  child: Row(
				children: [
				  Expanded(
					  child: Text(this._selectedDate == null
						  ? 'No Date Chosen!'
						  : DateFormat.yMd().format(this._selectedDate)),
					),
				  Container(
					margin: EdgeInsets.only(left: 10),
					child: OutlinedButton(
					  child: Text("Choose Date"),
					  onPressed: _presentDatePicker,
					),
				  )
				],
			  ),
			),
			ElevatedButton(
			  onPressed: submitTransition,
			  child: Text("Add Transition"),
			  style: ElevatedButton.styleFrom(
				  primary: Theme.of(context).primaryColor),
			)
		  ]),
		),
	  )),
	);
  }
}
