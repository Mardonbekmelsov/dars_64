import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/products_controller.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:lesson64_statemanagement/views/screens/add_product_screen.dart';
import 'package:lesson64_statemanagement/views/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  // final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<ProductsController>(context).list.length,
        itemBuilder: (ctx, index) {
          final product = Provider.of<ProductsController>(context).list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return const ProductItem();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductScreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
