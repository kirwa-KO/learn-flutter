import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/char_bar.dart';
import 'package:intl/intl.dart';
import '../models/Transition.dart';

class Chart extends StatelessWidget {
  final List<Transition> recentTransition;

  Chart(this.recentTransition);

  List<Map<String, Object>> get groupTransitionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransition.length; i++) {
        if (recentTransition[i].date.day == weekDay.day &&
            recentTransition[i].date.month == weekDay.month &&
            recentTransition[i].date.year == weekDay.year) {
          totalSum += recentTransition[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpend {
    return groupTransitionValues.fold(
        0.0, (sum, tran) => sum += tran['amount']);
  }

  @override
  Widget build(BuildContext context) {
    // print(groupTransitionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
		padding: EdgeInsets.all(10),
        child: Row(
		mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: this.groupTransitionValues.map((tran) {
          return Flexible(
			fit: FlexFit.tight,
            child: (
			ChartBar(tran['day'],
					tran['amount'],
					(totalSpend == 0.0 ? 0.0 :  (tran['amount'] as double) / totalSpend))
			),
          );
        }).toList()),
      ),
    );
  }
}
