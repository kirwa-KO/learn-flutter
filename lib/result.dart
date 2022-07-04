import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String phrase;

    if (resultScore < 50)
      phrase = "You lose..!!!";
    else
      phrase = "You win..!!!";
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
