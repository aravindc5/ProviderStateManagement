import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/pages/cart_page.dart';
import 'package:statemanagement/provider/cart.dart';
import 'package:statemanagement/widgets/app_drawer.dart';
import 'package:statemanagement/widgets/badge.dart';
import 'package:statemanagement/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewPage extends StatefulWidget {
  @override
  _ProductOverviewPageState createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  var _showMyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Shop App'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedItemValue) {
              setState(() {
                if (selectedItemValue == FilterOptions.Favorites) {
                  _showMyFav = true;
                } else {
                  _showMyFav = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('My Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('All Items'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartPage.routeName),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showMyFav),
    );
  }
}
