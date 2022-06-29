import "package:flutter/material.dart";

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
  List<String> _qsts = [
    "what is your favorite color ??",
    "what is your favorite animal ??",
    "what is your favorite glass ??",
    "what is your favorite sport ??",
  ];

  void _answerQuestion() {
    setState(() {
      _qstIndex += 1;
    });
    print("answer choosenn!!!");
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Text("Hello World !!!"));
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My first app"),
      ),
      body: Column(
        children: [
          Text(_qsts[_qstIndex]),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: _answerQuestion,
          ),
        ],
      ),
    ));
  }
}
