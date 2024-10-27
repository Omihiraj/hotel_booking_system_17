import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final GestureTapCallback? onTap;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.btnText,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.black),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Text(
                  btnText,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
