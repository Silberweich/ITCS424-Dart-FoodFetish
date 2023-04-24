import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "There is an Error, Go back right now!",
              style: GoogleFonts.robotoCondensed(
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(child: Image.asset(
            "assets/foodFetishLogo.png",
            height: MediaQuery.of(context).size.height * .40,
            )
          ),
        ],
      ),
    );
  }
}