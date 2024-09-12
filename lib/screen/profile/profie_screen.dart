import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/screen/login/login_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                authProvider.logout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen()), // Arahkan ke halaman login
                );
              },
              child: const Text('logout'))),
    );
  }
}
