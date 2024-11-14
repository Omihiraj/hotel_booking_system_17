import 'package:flutter/material.dart';
import 'package:hotel_booking_app/providers/hotel_provider.dart';
import 'package:hotel_booking_app/widgets/hotel_card.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HotelProvider>().getOnlyFavouriteHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: context.read<HotelProvider>().favouriteHotels.length,
        itemBuilder: (BuildContext context, int index) {
          return HotelCard(
            hotelData: context.read<HotelProvider>().favouriteHotels[index],
            favoriteHotel: true,
            isDiscoverScreen: false,
          );
        },
      ),
    );
  }
}
