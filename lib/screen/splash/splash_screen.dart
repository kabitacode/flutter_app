import 'package:flutter/material.dart';
import 'package:flutter_app/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getAuthenticated();
  }

  Future<void> getAuthenticated() async {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    await splashProvider.tryAutoLogin();

    if (splashProvider.isLogin) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
