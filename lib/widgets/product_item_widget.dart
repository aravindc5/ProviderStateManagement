import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/models/product.dart';
import 'package:statemanagement/pages/product_details_page.dart';
import 'package:statemanagement/provider/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        trailing: Consumer<Product>(
          builder: (context, product, _) => IconButton(
              icon: Icon(
                product.isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
              ),
              onPressed: () {
                product.isFavoriteChanged();
              }),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            }),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductDetails.routeName, arguments: product.id),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
