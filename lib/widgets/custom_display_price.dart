import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_burger/constants.dart';

class CustomDisplayPrice extends StatelessWidget {
  final double price;
  const CustomDisplayPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceStr = price.toString();
    final pointIndex = priceStr.indexOf(".");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "\$${priceStr.substring(0, pointIndex+1)}",
          style: GoogleFonts.roboto(
            color: kPrimaryColor,
            fontSize: 46.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: (8 - (32*6/46))),
          child: Text(
            "${priceStr.substring(pointIndex+1, priceStr.length)}",
            style: GoogleFonts.roboto(
              color: kPrimaryColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
