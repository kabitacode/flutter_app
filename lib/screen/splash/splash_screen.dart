import 'package:flutter/material.dart';
import 'package:flutter_app/providers/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

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
    await splashProvider.loadToken();

    if (splashProvider.isLogin) {
      Future.delayed(
          const Duration(
            seconds: 5,
          ), () {
        return Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      Future.delayed(
          const Duration(
            seconds: 5,
          ), () {
        return Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Lottie.asset('assets/lotties/lottie_splash.json',
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
    ));
  }
}
