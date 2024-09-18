import 'package:flutter/material.dart';
import 'package:flutter_app/services/profile_services.dart';

class ProfileProvider extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProfile(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      final profileServices = await ProfileServices();
      final response = await profileServices.fetchProfile(token);

      _data = response;
    } catch (e) {
      throw Exception("");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
