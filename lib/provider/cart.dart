import 'package:flourapp/constant/Screen/function/listofprodct.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List selectedProduct = [];
  double total = 0;
  double delete = 0;
  addproduct(Products item) {
    selectedProduct.add(item);
    total = 0;
    selectedProduct.forEach((element) {
      total += element.price;
      // delete= total;
    });
    notifyListeners();
  }

  void removeprodect(Products item) {
    selectedProduct.remove(item);
    total = 0;
    selectedProduct.forEach((element) {
      total -= element.price;
      notifyListeners();
    });
    notifyListeners();
  }
}
