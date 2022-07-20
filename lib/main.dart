import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/CartProvider.dart';
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:flutter_complete_guide/screens/CartScreen.dart';
import 'package:provider/provider.dart';
import './screens/ProductDetailsScreen.dart';
import './screens/ProductOverviewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
		  CartScreen.routeName: (ctx) => CartScreen()
        },
      ),
    );
  }
}
