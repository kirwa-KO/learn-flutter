import 'package:flutter/material.dart';
import '../models/Transition.dart';
import './new_transition.dart';
import './transition_list.dart';

class UserTransition extends StatefulWidget {
  @override
  State<UserTransition> createState() => _UserTransitionState();
}

class _UserTransitionState extends State<UserTransition> {
  final List<Transition> trans = [
    Transition(id: "t1", title: 'Mouse', amount: 19.23, date: DateTime.now()),
    Transition(id: "t2", title: 'Milk', amount: 12.12, date: DateTime.now()),
  ];

  void _addNewTransition(String txTitle, double txAmount) {
    final newTran = Transition(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      trans.add(newTran);
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [NewTransition(_addNewTransition), TransitionList(this.trans)],
    ));
  }
}
