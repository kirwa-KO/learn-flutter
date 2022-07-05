import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resultScore;
  final resetHandler;

  Result(this.resultScore, this.resetHandler);

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
    return Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
		FlatButton(onPressed: this.resetHandler, child: Text("Reset Quiz"))
      ],
    );
  }
}
