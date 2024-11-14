import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';

class HotelProvider extends ChangeNotifier {
  List<Hotel> _hotels = [];

  List<dynamic> _favoriteHotelIds = [];

  final List<Hotel> _favoriteHotelList = [];

  addHotels({required List<Hotel> hotels}) {
    _hotels = hotels;
    notifyListeners();
  }

  addFovouriteHotelIds({required List<dynamic> favoriteHotelIds}) {
    _favoriteHotelIds = favoriteHotelIds;

    notifyListeners();
  }

  addFavouriteHotelId({required String hotelId}) {
    _favoriteHotelIds.add(hotelId);
    notifyListeners();
  }

  removeFavouriteHotelId({required String hotelId}) {
    _favoriteHotelIds.remove(hotelId);
    notifyListeners();
  }

  getOnlyFavouriteHotels() {
    _favoriteHotelList.clear();
    for (var hotel in _hotels) {
      if (_favoriteHotelIds.contains(hotel.id)) {
        _favoriteHotelList.add(hotel);
      }
    }
  }

  List<Hotel> get hotelsData => _hotels;
  List<dynamic> get favouriteHotelIds => _favoriteHotelIds;
  List<Hotel> get favouriteHotels => _favoriteHotelList;
}
