import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Change This
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/auth.png'),

            SizedBox(height: 20),

            Text(
              "Let's you in",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Color(0xff212121),
              ),
            ),

            SizedBox(height: 20),
            Column(
              spacing: 20,
              children: [
                SignInButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  Buttons.facebook,
                  text: "Continue with Facebook",
                  onPressed: () {},
                ),

                SignInButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  Buttons.google,
                  text: "Continue with Google",
                  onPressed: () {},
                ),

                SignInButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  Buttons.apple,
                  text: "Continue with Apple",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),

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

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xff335EF7),
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {
                context.go("/sign-up");
              },
              child: Text(
                "Sign in with password",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Color(0xff9E9E9E)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Color(0xff335EF7)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
