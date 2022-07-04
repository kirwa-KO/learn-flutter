import 'package:flutter/material.dart';
import "./question.dart";
import "./Answer.dart";

class Quiz extends StatelessWidget {
  final qsts;
  final qstIndex;
  final answerQuestion;

  Quiz(this.answerQuestion, this.qsts, this.qstIndex);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Question(qsts[qstIndex]["questionText"]),
        ...(qsts[qstIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    ));
  }
}
