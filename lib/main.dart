import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_burger/constants.dart';
import 'package:tasty_burger/screens/burger_details.dart';
import 'package:tasty_burger/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: MyHomePage(),
      initialRoute: "/",
      routes: {
        BurgerDetails.routeName: (ctx) => BurgerDetails(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "TastyBurger",
          style: GoogleFonts.roboto(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            FontAwesomeIcons.hamburger,
          ),
          SizedBox(width: kDefaultPadding),
        ],
      ),
      body: MainScreen(),
    );
  }
}

