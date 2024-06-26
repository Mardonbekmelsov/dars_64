import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/products_controller.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
  final titleController = TextEditingController();

  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  .addProduct(
                      titleController.text, double.parse(priceController.text));
              Navigator.pop(context);
            },
            child: Text("Add Product"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
