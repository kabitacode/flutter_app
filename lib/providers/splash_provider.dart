import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;
  bool get isLogin => _token != null;
  // is token in storage?
  Future<void> tryAutoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('access_token')) {
      _token = null;
      notifyListeners();
      return;
    }

    _token = prefs.getString('access_token');

    if (_token != null) {
      notifyListeners();
    }
  }

  //load token from storage
  Future<void> loadToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    _token = storage.getString('access_token');
    notifyListeners();
  }
}
