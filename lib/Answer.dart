import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String AnswrText;

  Answer(this.selectHandler, this.AnswrText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.AnswrText),
        onPressed: this.selectHandler,
      ),
    );
  }
}
