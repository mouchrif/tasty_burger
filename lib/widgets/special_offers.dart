import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_burger/constants.dart';
import 'package:tasty_burger/models/burger.dart';
import 'package:tasty_burger/screens/burger_details.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Special offers".toUpperCase(),
            style: GoogleFonts.roboto(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  Burger.burgers.length,
                  (index) => index == 0
                      ? Container()
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  BurgerDetails.routeName,
                                  arguments: index,
                                );
                                
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Hero(
                                        tag:
                                            "${Burger.burgers[index].assetName}",
                                        child: Image.asset(
                                          Burger.burgers[index].assetName,
                                          fit: BoxFit.fitHeight,
                                          height: size.height * 0.3,
                                          width: size.width * 0.41,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: kDefaultPadding,
                                      left: kDefaultPadding / 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Burger.burgers[index].name,
                                            style: GoogleFonts.roboto(
                                                color: kWhiteColor,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding / 3,
                                                vertical: kDefaultPadding / 4),
                                            decoration: BoxDecoration(
                                              color: kTagColor,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "\$ ${Burger.burgers[index].price}",
                                              style: GoogleFonts.roboto(
                                                  color: kWhiteColor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
