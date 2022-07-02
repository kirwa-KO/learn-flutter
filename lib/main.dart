import "package:flutter/material.dart";
import "./quiz.dart";
import "./result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _qstIndex = 0;
  var _qsts = [
    {
      "questionText": "What's your favorite color ?",
      "answers": ["Black", "Red", "Blue", "Green"]
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": ["Dog", "Cat", "Snake", "Rabbit"]
    },
    {
      "questionText": "What's your favorite friend ?",
      "answers": ["Twelve", "Khalid", "Imran", "Motamanyak"]
    },
  ];

  void _answerQuestion() {
    setState(() {
      _qstIndex += 1;
    });
    // print("answer choosenn!!!");
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Text("Hello World !!!"));
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My first app"),
      ),
      body: _qstIndex < _qsts.length
          ? Quiz(_answerQuestion, _qsts, _qstIndex)
          : Result(),
    ));
  }
}
