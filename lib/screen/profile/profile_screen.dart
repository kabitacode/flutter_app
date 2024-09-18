import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/providers/profile_provider.dart';
import 'package:flutter_app/screen/login/login_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? token;
  late ProfileProvider profileProvider;

  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.getToken();
    token = await authProvider.token;

    profileProvider = Provider.of<ProfileProvider>(context, listen: false);

    if (token != null) {
      await profileProvider.getProfile(token!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        body: profileProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(profileProvider.data['avatar'] ?? '')
                    ],
                  )
                ],
              )));
  }
}
