import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Sign In",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          textFieldName: "E-Mail",
        ),
        CustomTextField(
          textFieldName: "Password",
        ),
        CustomButton(
          btnText: "SignIn",
        )
      ],
    );
  }
}
