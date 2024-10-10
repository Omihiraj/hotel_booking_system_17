import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static getHotels() async {
    CollectionReference hotelCollectionReference =
        FirebaseFirestore.instance.collection("hotels");

    final hotels = await hotelCollectionReference.get();

    // hotels.docs.forEach((hotel) {
    //   print(hotel["prices"]);
    // });

    print(hotels.docs[1]["prices"]);
  }
}
