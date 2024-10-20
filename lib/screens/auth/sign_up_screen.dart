import 'package:flutter/material.dart';
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
  String? nameErrorText;
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
        const CustomTextField(
          textFieldName: "Address",
        ),
        const CustomTextField(
          textFieldName: "E-Mail",
        ),
        const CustomTextField(
          textFieldName: "Mobile Number",
        ),
        const CustomTextField(
          textFieldName: "Password",
        ),
        CustomButton(
          btnText: "SignUp",
          onTap: () {
            setState(() {
              nameErrorText = Validation.nameValidator(
                  nameFieldValue: nameFieldController.text.toString());
            });
          },
        )
      ],
    );
  }
}
