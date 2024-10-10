import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:hotel_booking_app/utils/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                // isPressed
                //     ? const SizedBox(width: 250, height: 30, child: TextField())
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Serach Places",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Date Range and Number of geusts",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
