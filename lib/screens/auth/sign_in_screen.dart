import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/services/firebase_auth_service.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailErrorText;
  String? passwordErrorText;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sign In",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: emailController,
          textFieldName: "E-Mail",
          errorText: emailErrorText,
        ),
        CustomTextField(
          controller: passwordController,
          textFieldName: "Password",
          errorText: passwordErrorText,
        ),
        CustomButton(
          btnText: "SignIn",
          isLoading: isLoading,
          onTap: () {
            setState(() {
              isLoading = true;
            });
            FirebaseAuthService.signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim())
                .then((value) {
              FirebaseAuth.instance.authStateChanges().listen((user) {
                if (user == null) {
                  setState(() {
                    isLoading = false;
                  });
                }
              });

              if (value == "error" || value == "invalid-credential") {
                setState(() {
                  emailErrorText = "Invalid Credentials";
                  passwordErrorText = "Invalid Credentials";
                });
              } else if (value == "success") {
                emailErrorText = null;
                passwordErrorText = null;
              }
            });
          },
        ),
      ],
    );
  }
}
