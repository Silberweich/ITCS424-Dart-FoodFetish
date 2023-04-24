import 'package:flutter/material.dart';
import 'package:food_fetish/app/tabRender.dart';
import 'package:food_fetish/app/template/customList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recipe_json_convert.dart';
import 'dart:developer';
import 'package:food_fetish/app/errorPage.dart';

class ResultPage extends StatefulWidget {
  FullData data;
  String title;

  ResultPage({Key? key, required this.data, required this.title}) : super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}


class ResultPageState extends State<ResultPage>{
  late Future<String> data;
  // @override
  // void initState() {
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Recipes on \"${widget.title}\" ",
          style: GoogleFonts.robotoCondensed(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: widget.data.hits.length,
        //padding: const EdgeInsets.all(2.0),
        itemExtent: 150.0,
        itemBuilder: (context, index) {
          //log(widget.data.hits[index].recipe.image);
          return Container(
            // ignore: prefer_const_constructors
            color: (index % 2 == 1) ? Color.fromARGB(255, 255, 222, 212) : Color.fromARGB(255, 255, 255, 255) ,
            child: GestureDetector(
            onTap:() {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => TabRenderer(data: widget.data.hits[index] ,title: widget.data.hits[index].recipe.label)
                  ),
                (route) => true);
            },
            child: CustomListItem(
              thumbnail: Image.network(widget.data.hits[index].recipe.image),
              title: "${widget.data.hits[index].recipe.label} (${widget.data.hits[index].recipe.cuisineType[0]} cuisine)",
              subtitle: dietTyper(widget.data.hits[index].recipe.dietLabels),
              subtitle2: dietTyper(widget.data.hits[index].recipe.healthLabels),
              author: "Calories: ${widget.data.hits[index].recipe.calories.toStringAsFixed(3)}cal.    Weight: ${widget.data.hits[index].recipe.totalWeight.toStringAsFixed(3)} grams.",
              publishDate: "1", 
            ),
          ),
          );  
        }, 
      )
    );
  }
  String dietTyper(List<String> d){
    if (d.isEmpty) return "N/A";
    String li = "";
    for (var a in d){
      li += "[";
      li += a;
      li += "]";
    }
    return li;
  }
}
