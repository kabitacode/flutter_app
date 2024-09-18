import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileServices {
  Future<Map<String, dynamic>> fetchProfile(String token) async {
    try {
      final url = Uri.parse('https://api.escuelajs.co/api/v1/auth/profile');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      if (res.statusCode == 200) {
        final result = await json.decode(res.body) as Map<String, dynamic>;
        return result;
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Oops something wrong : $e');
    }
  }
}
