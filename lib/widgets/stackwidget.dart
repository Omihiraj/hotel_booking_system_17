import 'package:flutter/material.dart';

class Stackwidget extends StatelessWidget {
  const Stackwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1.0),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assest/hotel.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 320,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_sharp,
                  size: 30,
                ))),
        Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(20)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 247, 9),
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 247, 9),
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
              ],
            ))
      ],
    );
  }
}
