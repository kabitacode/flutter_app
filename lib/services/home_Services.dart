import 'dart:convert';

import 'package:flutter_app/models/product.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  final String baseUrl = "https://api.escuelajs.co/api/v1/products";

  Future<List<Product>> getProduct() async {
    try {
      final res = await http.get(Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'});

      if (res.statusCode == 200) {
        final List<dynamic> result = json.decode(res.body);
        return result.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch product');
      }
    } catch (e) {
      throw Exception('Failed to fetch : $e');
    }
  }
}
