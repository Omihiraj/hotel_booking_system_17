import 'package:flutter/material.dart';
import 'package:hotel_booking_app/services/firebase_auth_service.dart';
import 'package:hotel_booking_app/utils/validation/validation.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  String? nameErrorText;
  String? emailErrorText;
  String? passwordErrorText;
  String? mobileNumberErrorText;
  String? addressErrorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          textFieldName: "Name",
          controller: nameFieldController,
          errorText: nameErrorText,
        ),
        CustomTextField(
          textFieldName: "Address",
          controller: addressFieldController,
          errorText: addressErrorText,
        ),
        CustomTextField(
          textFieldName: "E-Mail",
          controller: emailFieldController,
          errorText: emailErrorText,
        ),
        CustomTextField(
          textFieldName: "Mobile Number",
          controller: mobileNumberFieldController,
          errorText: mobileNumberErrorText,
        ),
        CustomTextField(
          textFieldName: "Password",
          controller: passwordController,
          errorText: passwordErrorText,
        ),
        CustomButton(
          btnText: "SignUp",
          onTap: () {
            FirebaseAuthService.signUp(
                email: emailFieldController.text.trim(),
                password: passwordController.text.trim(),
                address: addressFieldController.text.trim(),
                mobileNo: mobileNumberFieldController.text.trim(),
                name: nameFieldController.text.trim());
          },
        )
      ],
    );
  }
}
