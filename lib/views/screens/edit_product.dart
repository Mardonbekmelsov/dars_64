import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/products_controller.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatelessWidget {
  // final Product product;
  // EditProduct({required this.product});

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: true);
    titleController.text = product.title;
    priceController.text = product.price.toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Enter Product name"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              hintText: "Enter Price",
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ProductsController>(context, listen: false)
                  .editProduct(product.id, titleController.text,
                      double.parse(priceController.text));
              Navigator.pop(context);
            },
            child: Text("Edit Product"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
