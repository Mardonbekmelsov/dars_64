import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/models/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone",
      color: Colors.teal,
      price: 340.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Macbook",
      color: Colors.grey,
      price: 1340.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "AirPods",
      color: Colors.blue,
      price: 140.5,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(String title, double price) {
    _list.add(
      Product(
        id: UniqueKey().toString(),
        title: title,
        color: Color.fromARGB(
          255,
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
        ),
        price: price,
      ),
    );
    notifyListeners();
  }

  void removeProduct(String id) {
    print("product deleted");
    _list.removeWhere((product) {
      return product.id == id;
    });
    notifyListeners();
  }

  void editProduct(String id, String title, double price) {
    print("product edited");
    for (var product in _list) {
      if (product.id == id) {
        product.title = title;
        product.price = price;
        break;
      }
    }
    notifyListeners();
  }
}
