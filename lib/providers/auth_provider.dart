import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  Future<void> handleLogin(String email, String password) async {
    final authServices = AuthServices();
    final response = await authServices.login(email, password);

    if (response != null && response.containsKey('access_token')) {
      _token = response['access_token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', _token!);

      notifyListeners();
    } else {
      print('Login failed, response is null or does not contain access_token');
    }
  }

  Future<void> logout() async {
    _token = null;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');

    notifyListeners();
  }
}
