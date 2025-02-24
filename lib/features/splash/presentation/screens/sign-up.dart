import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/routes/route_paths.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go("/auth");
          },
        ),
      ),
      //TODO: Change This
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // spacing: 58,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create your Account",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff212121),
                  height: 56 / 48,
                ),
              ),
              Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
        
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        side: BorderSide(color: Color(0xff335EF7), width: 2),
                        checkColor: Color(0xff335EF7),
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff212121),
                        ),
                      ),
                    ],
                  ),
        
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xff335EF7),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      context.go(RoutePaths.fillYourProfile);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(child: Divider(color: Color(0xffEEEEEE))),
                      Text(
                        "or continue with, ",
                        style: TextStyle(color: Color(0xff616161)),
                      ),
                      Expanded(child: Divider(color: Color(0xffEEEEEE))),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 18,
                        ),
                        child: Image.asset("assets/images/google.png"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 18,
                        ),
                        child: Image.asset("assets/images/google.png"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 18,
                        ),
                        child: Image.asset("assets/images/apple.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Color(0xff9E9E9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go("/sign-in");
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xff335EF7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
