import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  final String _baseUrl = 'https://api.escuelajs.co/api/v1/auth/login';

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.post(Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}));

    if (response.statusCode == 201) {
      final result = json.decode(response.body);
      return result;
    } else {
      throw Exception('Failed to login');
    }
  }
}
