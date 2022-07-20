import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:provider/provider.dart';
import './screens/ProductDetailsScreen.dart';
import './screens/ProductOverviewScreen.dart';
=======
import 'package:flutter_complete_guide/screens/CategoryMealScreen.dart';
import 'package:flutter_complete_guide/screens/MealScreen.dart';
import 'package:flutter_complete_guide/screens/TabsScreen.dart';
import './screens/CategoryScreen.dart';
>>>>>>> c9b53b833a8e7dba3511a138e7520a4124f246b5

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen()
        },
      ),
=======
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
>>>>>>> c9b53b833a8e7dba3511a138e7520a4124f246b5
    );
  }
}
