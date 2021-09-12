import 'package:flutter/material.dart';

import '../constants.dart';

class IngredientItem extends StatelessWidget {
  final double radius1;
  final double radius2;
  final double imageWidth;
  final String assetName;
  const IngredientItem(
      {Key? key,
      required this.assetName,
      required this.radius1,
      required this.radius2, 
      required this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius1,
      backgroundColor: kGreyColor,
      child: CircleAvatar(
        backgroundColor: kWhiteColor,
        radius: radius2,
        child: ClipOval(
          child: Image.asset(assetName, width: imageWidth),
        ),
      ),
    );
  }
}
