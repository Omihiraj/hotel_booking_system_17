import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hotel_booking_app/models/hotel.dart';

class FirebaseServices {
  //Get Hotels Document from FireBase DB and return Hotel type data
  static Future<List<Hotel>> getHotels() async {
    //Get data from FireBase DB
    CollectionReference hotelCollectionReference =
        FirebaseFirestore.instance.collection("hotels");

    final hotelDocuments = await hotelCollectionReference.get();

    hotelCollectionReference.get().then((hotelDocuments) {});

    List<Hotel> hotels = [];
    for (var hotelDoc in hotelDocuments.docs) {
      hotels.add(
        Hotel(
          title: hotelDoc["title"],
          rating: hotelDoc["rating"],
          prices: hotelDoc["prices"],
          mainImage: hotelDoc["main-image"],
          otherImages: hotelDoc["other-images"],
          amenities: hotelDoc["amenities"],
        ),
      );
    }

    return hotels;
  }

  static addSignUpData(
      {required String email,
      required String name,
      required String address,
      required String mobileNo}) {
    CollectionReference userCollectionReference =
        FirebaseFirestore.instance.collection("users");

    userCollectionReference.add({
      "email": email,
      "name": name,
      "address": address,
      "mobile_number": mobileNo
    });
  }
}
