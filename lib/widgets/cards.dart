import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String name;
  final String imge;
  const Cards({super.key, required this.name, required this.imge});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Image.asset(
            imge,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }
}
