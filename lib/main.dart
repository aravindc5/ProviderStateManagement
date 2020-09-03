import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/pages/cart_page.dart';
import 'package:statemanagement/pages/order_page.dart';
import 'package:statemanagement/pages/product_details_page.dart';
import 'package:statemanagement/provider/cart.dart';
import 'package:statemanagement/provider/order.dart';
import 'package:statemanagement/provider/product_provider.dart';

import './pages/product_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'ShopApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductOverviewPage(),
        routes: {
          ProductDetails.routeName: (context) => ProductDetails(),
          CartPage.routeName: (context) => CartPage(),
          OrdersPage.routeName: (context) => OrdersPage(),
        },
      ),
    );
  }
}
