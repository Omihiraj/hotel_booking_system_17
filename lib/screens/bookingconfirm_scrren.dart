import 'package:flutter/material.dart';

import 'package:hotel_booking_app/widgets/cards.dart';
import 'package:hotel_booking_app/widgets/custombutton.dart';
import 'package:hotel_booking_app/widgets/stackwidget.dart';

class Confirmpage extends StatelessWidget {
  const Confirmpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Stackwidget(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 640,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 217, 213, 213)
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(45)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 150,
                          width: 400,
                          margin:
                              const EdgeInsets.only(top: 40, left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(45)),
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                padding: const EdgeInsets.only(left: 40),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assest/pool.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 50, top: 30),
                                child: const Column(
                                  children: [
                                    Text(
                                      "Sudu Araliya",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(Icons.hotel),
                                        ),
                                        Text("Galle Road,Matara")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "\$99.00/night",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Amenities",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(name: "Resto", imge: "assest/item1.png"),
                            Cards(name: "Fool", imge: "assest/item2.png"),
                            Cards(name: "Foods", imge: "assest/item3.png"),
                            Cards(name: "Key", imge: "assest/item4.png"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Desription",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(
                          "o create a layout similar to the container in the middle of the image, you can adjust your current code as follows. It appears you want to place a container with rounded corners over the image"),
                      const SizedBox(
                        height: 25,
                      ),
                      const Card(
                        child: ListTile(
                          focusColor: Colors.white,
                          title: Text("D.A.N.D.Dissanayaka"),
                          trailing: Text(
                            "2024.10.14",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Custombutton(
                          text: "Pay Now",
                          onpresses: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
