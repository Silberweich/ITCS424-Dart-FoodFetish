import 'dart:convert';
import 'dart:developer';
import 'package:food_fetish/app/resultPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'recipe_json_convert.dart';
import 'package:flutter/services.dart';
import 'errorPage.dart';
import 'package:http/http.dart' as http;

String APP_ID = "6f2068fd";
String APP_KEY = "f07511d028706a39501d93d982cf92f6";

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController ingredientController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.robotoCondensed(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/foodFetishLogo.png",
              height: MediaQuery.of(context).size.height * .35,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 4.0),
              child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: ingredientController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Search Recipe Here",
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            getData(ingredientController.text);
                          }))),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        //child: Image.asset("assets/images/logo-color.png"),
      ),
    );
  }

  Future<void> getData(String query) async {
    var url = Uri.parse(makeURL(query));

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      final parsedJson = jsonDecode(data);
      final jsonData = FullData.fromJson(parsedJson);
      //print(parsedJson);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              data: jsonData,
              title: ingredientController.text,
            ),
          ),
          (route) => true);
    }else{
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ErrorPage()),
          (route) => true);
    }
    
  }

  String makeURL(String query) {
    return "https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=$APP_ID&app_key=$APP_KEY";
  }

}