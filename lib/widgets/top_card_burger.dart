import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_burger/constants.dart';

class TopCardBurger extends StatelessWidget {
  final String title;
  final String assetName;
  final double price;
  final double weight;
  final String ingredients;
  const TopCardBurger({
    Key? key,
    required this.title,
    required this.assetName,
    required this.price,
    required this.weight,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Card(
        margin: const EdgeInsets.all(kDefaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.56 - kDefaultPadding,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.asset(
                      assetName,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.44 - kDefaultPadding,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.roboto(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ingredients,
                          style: GoogleFonts.roboto(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: kDefaultPadding,
              left: kDefaultPadding,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 2,
                    vertical: kDefaultPadding / 3),
                decoration: BoxDecoration(
                  color: kTagColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "\$ $price",
                  style: GoogleFonts.roboto(
                      color: kWhiteColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: kDefaultPadding,
              left: kDefaultPadding,
              child: Container(
                child: Text(
                  "${weight.toStringAsFixed(0)}g",
                  style: GoogleFonts.roboto(
                      color: kWhiteColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
LayoutBuilder(
      builder: (context, constraints) => Card(
        margin: const EdgeInsets.all(kDefaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth*0.52,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.asset(
                      Burger.burgers[0].assetName,
                      height: constraints.maxHeight,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Burger.burgers[0].name,
                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Egg, Mushroom, Worcestershire Sauce, Onion, Garlic, Medium Ground Beef",
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top:kDefaultPadding,
              left: kDefaultPadding,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding/2,
                  vertical: kDefaultPadding/3
                ),
                decoration: BoxDecoration(
                  color: Color(0xff95BE17),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "\$ ${Burger.burgers[0].price}",
                  style: GoogleFonts.roboto(
                    color: kWhiteColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: kDefaultPadding,
              left: kDefaultPadding,
              child: Container(
                child: Text(
                  "${Burger.burgers[0].weight.toStringAsFixed(0)}g",
                  style: GoogleFonts.roboto(
                    color: kWhiteColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
*/