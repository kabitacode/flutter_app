import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => token;

  Future<void> login(String email, String password) async {
    final authServices = AuthServices();
    final response = await authServices.login(email, password);
    if (response != null) {
      _token = response['access_token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', _token!);

      notifyListeners();
    }
  }

  Future<void> logout() async {
    _token = null;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_toke');

    notifyListeners();
  }
}
