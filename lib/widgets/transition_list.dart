import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../models/Transition.dart';

class TransitionList extends StatelessWidget {
  final List<Transition> trans;
  final Function _deleteTran;

  TransitionList(this.trans, this._deleteTran);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: this.trans.isEmpty
            ? LayoutBuilder(
                builder: ((context, constraints) {
                  return Center(
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
                          height: constraints.maxHeight * 0.4,
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  );
                }),
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
                          child: FittedBox(
                              child: Text('\$${this.trans[index].amount}')),
                        ),
                      ),
                      title: Text(
                        this.trans[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(this.trans[index].date)),
                      trailing: MediaQuery.of(context).size.width > 460
                          ? FlatButton.icon(
                              icon: Icon(Icons.delete),
                              label: Text("Delete"),
                              textColor: Theme.of(context).errorColor,
                              onPressed: () =>
                                  this._deleteTran(this.trans[index].id),
                            )
                          : IconButton(
                              icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                              onPressed: () =>
                                  this._deleteTran(this.trans[index].id),
                            ),
                    )),
                  );
                },
                itemCount: this.trans.length,
              ));
  }
}
