import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeServices {
  final String baseUrl = "https://api.escuelajs.co/api/v1/products";
  Future<void> getProduct() async {
    try {
      final res = await http.get(Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'});

      if (res.statusCode == 200) {
        final result = json.decode(res.body);
        return result;
      }
    } catch (e) {
      throw Exception('Failed to fetch : $e');
    }
  }
}
