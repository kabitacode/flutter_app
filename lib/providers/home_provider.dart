import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/services/home_Services.dart';

class HomeProvider with ChangeNotifier {
  List<Product> _product = [];
  List<Product> get products => _product;

  Future<void> fetchProduct() async {
    final homeServices = await HomeServices();
    final response = await homeServices.getProduct();

    if (response != null) {
      _product = response;
      notifyListeners();
    }
  }
}
