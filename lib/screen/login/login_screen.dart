import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/screen/main/main_screen.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
  bool isVisibility = false;

  Future<void> _login(BuildContext context) async {
    setState(() {
      _isloading = true;
    });

    try {
      if (_emailController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Email is Empty!")));
      } else if (_passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Password is Empty!")));
      } else {
        // call from AuthProvider
        await Provider.of<AuthProvider>(context, listen: false)
            .handleLogin(_emailController.text, _passwordController.text);

        // login success go to home
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
        showCloseIcon: true,
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Sign In')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const Icon(
                  Icons.store,
                  color: colorOrange,
                  size: 100,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: Text(
                  'Welcome to Store!',
                  style: GoogleFonts.lato(
                    color: colorTypography,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text(
                  'make sure you shop happily!',
                  style: GoogleFonts.openSans(
                    color: colorTypography,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: colorPrimary)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    labelText: "Email"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: colorPrimary)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibility = !isVisibility;
                          });
                        },
                        icon: Icon(isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    labelText: "Password"),
                obscureText: !isVisibility,
              ),
              const SizedBox(
                height: 50,
              ),
              _isloading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(45),
                              backgroundColor: colorSecondary),
                          onPressed: () => _login(context),
                          child: Text(
                            "Login",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
