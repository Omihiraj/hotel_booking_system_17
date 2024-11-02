import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback onpresses;
  const Custombutton({super.key, required this.text, required this.onpresses});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpresses,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            backgroundColor: Colors.blueAccent),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
