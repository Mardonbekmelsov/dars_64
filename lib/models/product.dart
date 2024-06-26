import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String id;
  String title;
  Color color;
  double price;
  // DateTime date;

  Product({
    required this.id,
    required this.title,
    required this.color,
    required this.price,
    // required this.date
  });
}
