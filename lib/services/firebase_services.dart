import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hotel_booking_app/models/hotel.dart';
import 'package:provider/provider.dart';

import '../providers/hotel_provider.dart';

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
          id: hotelDoc.id,
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

  static Future<String> getCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    var cuurentUserEmail = user!.email;

    final collectionReference = FirebaseFirestore.instance.collection("users");

    QuerySnapshot<Map<String, dynamic>> documents = await collectionReference
        .where("email", isEqualTo: cuurentUserEmail)
        .get();

    String userDocId = documents.docs[0].id;

    return userDocId;
  }

  static addFavouriteHotel(
      {required String hotelId, required BuildContext context}) async {
    final collectionReference = FirebaseFirestore.instance.collection("users");
    final userDocId = await getCurrentUserId();

    var document = await collectionReference.doc(userDocId).get();

    //Check Existing Favourite Hotels & Add New Favourite Hotel
    try {
      if (document["favourite-hotels"] != null) {
        List<dynamic> favouriteHotels = document["favourite-hotels"];

        favouriteHotels.add(hotelId);

        collectionReference
            .doc(userDocId)
            .update({'favourite-hotels': favouriteHotels}).then((val) {
          context.read<HotelProvider>().addFavouriteHotelId(hotelId: hotelId);
        });
      }
    } catch (e) {
      collectionReference.doc(userDocId).update({
        'favourite-hotels': [hotelId]
      }).then((val) {});
    }
  }

  static Future<List<dynamic>> getCurrentUserFavouriteHotels() async {
    final collectionReference = FirebaseFirestore.instance.collection("users");
    final userDocId = await getCurrentUserId();

    var document = await collectionReference.doc(userDocId).get();

    try {
      if (document["favourite-hotels"] != null) {
        List<dynamic> favouriteHotels = await document["favourite-hotels"];

        return favouriteHotels;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static removeHotelFromFavourite(
      {required List<dynamic> updatedHotelList,
      required String removedItemId,
      required BuildContext context}) async {
    final collectionReference = FirebaseFirestore.instance.collection("users");
    final userDocId = await getCurrentUserId();

    var document = await collectionReference
        .doc(userDocId)
        .update({'favourite-hotels': updatedHotelList}).then((value) {
      context
          .read<HotelProvider>()
          .removeFavouriteHotelId(hotelId: removedItemId);
    });
  }
}
