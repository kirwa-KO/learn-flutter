import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transition_list.dart';
import './models/Transition.dart';
import './widgets/new_transition.dart';
import "dart:io";

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
        textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
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

  void _addNewTransition(String txTitle, double txAmount, DateTime txDate) {
    final newTran = Transition(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate);
    setState(() {
      trans.add(newTran);
    });
  }

  void _deleteTransition(String id) {
    setState(() {
      this.trans.removeWhere((tran) => tran.id == id);
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

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                child: Icon(CupertinoIcons.add),
                onTap: () => _startAddNewTransition(context),
              )
            ]),
          )
        : AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Personel Exprenses'),
            actions: [
              IconButton(
                  onPressed: () => _startAddNewTransition(context),
                  icon: Icon(Icons.add))
            ],
          );

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final ListTrans = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          (isLandscape ? 1 : 0.7),
      child: Column(
        children: [
          //   NewTransition(_addNewTransition),
          TransitionList(this.trans, this._deleteTransition)
        ],
      ),
    );

    final ChartWidget = Container(
      width: double.infinity,
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          (isLandscape ? 0.7 : 0.3),
      child: Chart(_recentTransition),
    );

    final pageBody = SafeArea(
        child: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart', style: Theme.of(context).textTheme.titleMedium,),
                  Switch.adaptive(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (isLandscape) _showChart ? ChartWidget : ListTrans,
            if (!isLandscape) ChartWidget,
            if (!isLandscape) ListTrans
          ]),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () => _startAddNewTransition(context),
                  ),
          );
  }
}
