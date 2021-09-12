import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_burger/animations/fade_animation_title.dart';
import 'package:tasty_burger/animations/fade_in_animation.dart';
import 'package:tasty_burger/constants.dart';
import 'package:tasty_burger/models/burger.dart';
import 'package:tasty_burger/widgets/custom_display_price.dart';
import 'package:tasty_burger/widgets/ingredient_item.dart';

class BurgerDetails extends StatefulWidget {
  final bool? isAnimStart;
  const BurgerDetails({Key? key, this.isAnimStart}) : super(key: key);
  static String routeName = "burger-details";

  @override
  _BurgerDetailsState createState() => _BurgerDetailsState();
}

class _BurgerDetailsState extends State<BurgerDetails>
    with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<double>? _animHeight;
  Animation<double>? _animHeightClick;

  bool isAnim1End = false;
  bool _isAnim2End = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animHeight = Tween<double>(begin: 0.25, end: 0.4).animate(CurvedAnimation(
      parent: _animController!,
      curve: Curves.easeInOut,
    ));
    _animHeightClick =
        Tween<double>(begin: 0.4, end: 0.9).animate(CurvedAnimation(
      parent: _animController!,
      curve: Curves.easeInOut,
    ));
    if (_animController!.isDismissed) {
      _animController!.forward().whenComplete(() {
        _animController!.reset();
        setState(() {
          isAnim1End = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: "${Burger.burgers[args].assetName}",
            child: Image.asset(
              Burger.burgers[args].assetName,
              height: size.height,
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kDefaultPadding * 2,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 18.0,
                        color: kWhiteColor,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.heart,
                      size: 18.0,
                      color: kWhiteColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: FadeAnimationTitle(
                        delay: 50,
                        aniOffsetX: 0.0,
                        aniOffsetY: 0.35,
                        animationDuration: 500,
                        child: Text(
                          Burger.burgers[args].name,
                          style: GoogleFonts.roboto(
                              color: kWhiteColor,
                              fontSize: 46.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FadeAnimationTitle(
                            delay: 100,
                            aniOffsetX: 0.0,
                            aniOffsetY: 0.35,
                            animationDuration: 500,
                            child: Text(
                              "${Burger.burgers[args].weight.toStringAsFixed(0)}g",
                              style: GoogleFonts.roboto(
                                  color: kWhiteColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 8),
                          FadeAnimationTitle(
                            delay: 200,
                            aniOffsetX: 0.0,
                            aniOffsetY: 0.35,
                            animationDuration: 500,
                            child: CustomDisplayPrice(
                              price: Burger.burgers[args].price,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _animController!,
              builder: (context, child) => Container(
                height: isAnim1End
                    ? size.height * _animHeightClick!.value
                    : size.height * _animHeight!.value,
                padding: const EdgeInsets.only(
                  top: kDefaultPadding,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          if (_animController!.isDismissed) {
                            _animController!.forward().whenComplete(() {
                              setState(() {
                                _isAnim2End = true;
                              });
                            });
                          }
                        },
                        child: Icon(
                          FontAwesomeIcons.chevronUp,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: kDefaultPadding),
                          child: Text(
                            "Ingredients",
                            style: GoogleFonts.roboto(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding,
                            ),
                            child: Row(
                              children: [
                                ...List.generate(
                                  Burger.burgers[args].ingredients.length,
                                  (index) => Row(
                                    children: [
                                      Column(
                                        children: [
                                          FadeInAnimation(
                                            delay: index * 50,
                                            animationDuration: 300,
                                            aniOffsetX: 0.0,
                                            aniOffsetY: 0.35,
                                            child: IngredientItem(
                                              radius1: size.width * 0.11,
                                              radius2: size.width * 0.1,
                                              imageWidth: size.width * 0.18,
                                              assetName: Burger.burgers[args]
                                                      .ingredients[index]
                                                  ['assetName'] as String,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          FadeInAnimation(
                                            delay: index * 300,
                                            animationDuration: 600,
                                            aniOffsetX: 0.0,
                                            aniOffsetY: 0.35,
                                            child: Text(
                                              Burger.burgers[args]
                                                      .ingredients[index]
                                                  ['name'] as String,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding,
                              horizontal: kDefaultPadding,
                            ),
                            color: kBgColor,
                            child: _isAnim2End
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: kDefaultPadding,
                                          ),
                                          child: FadeAnimationTitle(
                                            // delay: ,
                                            aniOffsetX: 0.0,
                                            aniOffsetY: 0.35,
                                            animationDuration: 300,
                                            child: Row(
                                              children: [
                                                ...List.generate(
                                                  Burger.ingredientCategories
                                                      .length,
                                                  (index) => Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            Burger.ingredientCategories[
                                                                index],
                                                            style: GoogleFonts.roboto(
                                                                color: index == 0
                                                                    ? kBlackColor
                                                                    : kGreyColor,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          // Container(
                                                          //   height: 4,
                                                          //   color: kPrimaryColor,
                                                          // ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      ...List.generate(
                                        Burger.burgers[args].ingredients
                                                .length - 3,
                                        (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: kDefaultPadding / 4),
                                          child: FadeAnimationTitle(
                                            delay: index * 100,
                                            aniOffsetX: 0.0,
                                            aniOffsetY: 0.35,
                                            animationDuration: 400,
                                            child: Row(
                                              children: [
                                                IngredientItem(
                                                  assetName: Burger.burgers[args]
                                                          .ingredients[index]
                                                      ['assetName'] as String,
                                                  radius1: size.width * 0.08,
                                                  radius2: size.width * 0.07,
                                                  imageWidth: size.width * 0.12,
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Burger.burgers[args]
                                                              .ingredients[index]
                                                          ['name'] as String,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      "\$0.3",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: size.height * 0.055,
                                                      width: size.width * 0.1,
                                                      decoration: BoxDecoration(
                                                        color: kGreyColor
                                                            .withOpacity(0.8),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                6),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          FontAwesomeIcons.minus,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "1",
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Container(
                                                      height: size.height * 0.055,
                                                      width: size.width * 0.1,
                                                      decoration: BoxDecoration(
                                                        color: kGreyColor
                                                            .withOpacity(0.8),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                6),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          FontAwesomeIcons.plus,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      child: FadeInAnimation(
                        delay: 600,
                        animationDuration: 900,
                        aniOffsetX: 0.0,
                        aniOffsetY: 0.35,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 1.5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Add to Cart",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: kBlackColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
