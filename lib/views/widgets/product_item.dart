import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/cart_controller.dart';
import 'package:lesson64_statemanagement/controllers/products_controller.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:lesson64_statemanagement/views/screens/edit_product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: true);

    return ListTile(
      onLongPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<Product>.value(
                      value: product,
                      builder: (context, child) {
                        return EditProduct();
                      },
                    )));
      },
      leading: CircleAvatar(
        backgroundColor: product.color,
        child: IconButton(
          onPressed: () {
            final productController =
                Provider.of<ProductsController>(context, listen: false);
            productController.removeProduct(product.id);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(
        product.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text("\$${product.price}"),
      trailing: Consumer<CartController>(
        builder: (context, controller, child) {
          print(product.title);

          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      controller.getProductAmount(product.id).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    controller.addToCart(product);
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                );
        },
      ),
    );
  }
}
