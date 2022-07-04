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
      "answers": [
        {"text": "Black", "score": 30},
        {"text": "Red", "score": 60},
        {"text": "Yellow", "score": 10},
        {"text": "Blue", "score": 100},
      ]
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": [
        {"text": "Cat", "score": 30},
        {"text": "Dog", "score": 60},
        {"text": "Snake", "score": 10},
        {"text": "Eagle", "score": 100},
      ]
    },
    {
      "questionText": "What's your favorite friend ?",
      "answers": [
        {"text": "Twelve", "score": 30},
        {"text": "Kirwa", "score": 60},
        {"text": "Motamanyak", "score": 10},
        {"text": "Seven", "score": 100},
      ]
    },
  ];

  int _totalscore = 0;

  void _answerQuestion(int score) {
    _totalscore += score;
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
          : Result(_totalscore),
    ));
  }
}
