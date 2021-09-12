import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_burger/constants.dart';
import 'package:tasty_burger/models/burger.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(
            Burger.foodCategories.length + 1, 
            (index) => Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding/3,
                    horizontal: kDefaultPadding/2
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: index==0
                    ? Icon(
                      FontAwesomeIcons.slidersH,
                      size: 20.0,
                    )
                    : Text(
                        Burger.foodCategories[index-1],
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                ),
                SizedBox(width: kDefaultPadding/1.6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
