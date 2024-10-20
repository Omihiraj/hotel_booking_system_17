import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/auth/sign_in_screen.dart';
import 'package:hotel_booking_app/screens/auth/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignInPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSignInPage ? const SignIn() : const SignUp(),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: isSignInPage
                    ? "You don't have an account  "
                    : "Already you have an account please  ",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                  text: isSignInPage ? "SignUp" : "SignIn",
                  style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isSignInPage = !isSignInPage;
                      });
                    }),
            ]),
          )
        ],
      ),
    );
  }
}
