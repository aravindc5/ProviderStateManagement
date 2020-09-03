import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/order.dart' show Orders;
import 'package:statemanagement/widgets/app_drawer.dart';
import 'package:statemanagement/widgets/order_item_widget.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = '\order_page';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Your Orders',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
