import "package:flutter/foundation.dart";

class Transition {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transition(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
