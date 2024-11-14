import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';
import 'package:hotel_booking_app/widgets/facility_item.dart';
import 'package:provider/provider.dart';

import '../providers/hotel_provider.dart';
import '../services/firebase_services.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({
    super.key,
    required this.hotelData,
    required this.favoriteHotel,
    this.isDiscoverScreen = true,
  });

  final Hotel hotelData;
  final bool favoriteHotel;
  final bool isDiscoverScreen;

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    bool favoriteHotelCard = context
        .watch<HotelProvider>()
        .favouriteHotelIds
        .contains(widget.hotelData.id);
    return InkWell(
      onTap: () {
        hotelDetailBottomSheet(hotel: widget.hotelData);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(widget.isDiscoverScreen ? 40 : 15),
              color: AppColors.primaryColor),
          width: 300,
          height: 250,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        widget.isDiscoverScreen ? 40 : 15),
                    child: Image.network(widget.hotelData.mainImage!),
                  ),
                  if (widget.isDiscoverScreen) ...[
                    Positioned(
                      top: 20,
                      right: 30,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: const Color.fromARGB(87, 0, 0, 0)),
                        child: Center(
                          child: InkWell(
                            onTap: favoriteHotelCard
                                //Remove Favourite Hotel
                                ? () {
                                    var currentHotelList = context
                                        .read<HotelProvider>()
                                        .favouriteHotelIds;
                                    currentHotelList
                                        .remove(widget.hotelData.id!);
                                    FirebaseServices.removeHotelFromFavourite(
                                      updatedHotelList: currentHotelList,
                                      removedItemId: widget.hotelData.id!,
                                      context: context,
                                    );
                                    Fluttertoast.showToast(
                                      msg: "Remove From Favorite",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor:
                                          const Color.fromARGB(139, 0, 0, 0),
                                      textColor: Colors.redAccent,
                                      fontSize: 16.0,
                                    );
                                  }
                                //Add Favourite Hotel
                                : () {
                                    FirebaseServices.addFavouriteHotel(
                                      hotelId: widget.hotelData.id!,
                                      context: context,
                                    );
                                    Fluttertoast.showToast(
                                        msg: "Add to Favorite",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor:
                                            const Color.fromARGB(139, 0, 0, 0),
                                        textColor: Colors.green,
                                        fontSize: 16.0);
                                  },
                            child: Icon(
                              favoriteHotelCard
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_outline,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.hotelData.title!),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text("${widget.hotelData.rating}")
                      ],
                    )
                  ],
                ),
              ),
              if (widget.isDiscoverScreen) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        widget.hotelData.amenities!.length,
                        (findex) => FacilityItem(
                          facilityName: widget.hotelData.amenities![findex],
                        ),
                      )),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  hotelDetailBottomSheet({required Hotel hotel}) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        elevation: 8.0,
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 1200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: hotel.otherImages!.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            image,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    hotel.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(hotel.rating.toString())
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(),
                )
              ],
            ),
          );
        });
  }
}
