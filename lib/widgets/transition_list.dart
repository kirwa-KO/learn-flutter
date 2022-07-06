import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../models/Transition.dart';

class TransitionList extends StatelessWidget {
  final List<Transition> trans;
  TransitionList(this.trans);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: this.trans.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No transitions added yet..!!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
					margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
					child: (ListTile(
					  leading: CircleAvatar(
						radius: 30,
						child: Padding(
						  padding: EdgeInsets.all(8.0),
						  child: FittedBox(child: Text('\$${this.trans[index].amount}')),
						),
					  ),
									title: Text(this.trans[index].title, style: Theme.of(context).textTheme.titleMedium,),
									subtitle: Text(DateFormat.yMMMd().format(this.trans[index].date)),
					)),
				  );
                },
                itemCount: this.trans.length,
              ));
  }
}
