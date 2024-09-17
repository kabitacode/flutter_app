import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/services/home_Services.dart';

class HomeProvider with ChangeNotifier {
  List<Product> _product = [];
  List<Product> get products => _product;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProduct() async {
    _isLoading = true;
    notifyListeners();

    try {
      final homeServices = await HomeServices();
      final response = await homeServices.getProduct();

      if (response != null) {
        _product = response;
      } else {
        _product = [];
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
