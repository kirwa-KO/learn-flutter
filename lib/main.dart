import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
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
          Text("The question ...?"),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: answerQuestion,
          ),
        ],
      ),
    ));
  }
}
