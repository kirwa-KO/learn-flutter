import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transition_list.dart';
import './models/Transition.dart';
import './widgets/new_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personel Exprenses',
      home: MyHomePage(),
	  theme: ThemeData(
		primarySwatch: Colors.red,
		fontFamily: 'Quicksand',
		textTheme: ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 15)),
		appBarTheme: AppBarTheme(
			titleTextStyle: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold),
	  	),
	  ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transition> trans = [
    Transition(id: "t1", title: 'Mouse', amount: 19.23, date: DateTime.now()),
    Transition(id: "t2", title: 'Milk', amount: 12.12, date: DateTime.now()),
  ];

//   final List<Transition> trans = [];

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

  void _startAddNewTransition(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransition(_addNewTransition),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

	List<Transition> get _recentTransition {
		return this.trans.where((tx) {
			return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
		}).toList();
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Personel Exprenses'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransition(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Chart(_recentTransition),
              ),
              Column(
                children: [
                //   NewTransition(_addNewTransition),
                  TransitionList(this.trans)
                ],
              )
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _startAddNewTransition(context),
      ),
    );
  }
}
