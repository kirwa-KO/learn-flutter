import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/CategoryMealScreen.dart';
import 'package:flutter_complete_guide/screens/MealScreen.dart';
import 'package:flutter_complete_guide/screens/TabsScreen.dart';
import './screens/CategoryScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
    //   home: CategoryScreen(),
      home: TabsScreen(),
      routes: {
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
        MealScreen.routeName: (context) => MealScreen()
      },
      //   onGenerateRoute: (settings) {
      //     print(settings.arguments);
      //   },
    //   onUnknownRoute: (settings) {
    //     return MaterialPageRoute(builder: (ctx) => CategoryScreen());
    //   },
    );
  }
}
