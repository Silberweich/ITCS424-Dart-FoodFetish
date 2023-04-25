import 'package:flutter/material.dart';
import 'package:food_fetish/app/recipe_json_convert.dart';
import 'package:food_fetish/app/template/recipe_details.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_fetish/app/func/logging.dart';

class NutritionPage extends StatefulWidget {
  Hit data;
  String title;

  NutritionPage({Key? key, required this.data, required this.title}) : super(key: key);

  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  @override

  Widget build(BuildContext context) {
    printLog("User Access NUTRITION Page for: ${widget.title}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.recipe.cuisineType[0],
                      style: kTinyTitleTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: new EdgeInsets.only(right: 13.0),
                      child: 
                        Text(
                          "Recipe Name: ${widget.data.recipe.label}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: kNormalTitleTextStyle,
                        ),
                        // InkWell(
                        //   child: Icon(
                        //     Icons.favorite_border,
                        //     color: Colors.black54,
                        //   ),
                        //   onTap: () {
                        //     print('My fav');
                        //   },
                        // ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              size: 15.0,
                              color: Colors.orange,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "For ${widget.data.recipe.recipeYield.toString()} People",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 0.3,
                      color: Colors.black54,
                    ),
                    RecipeDetails(
                      title: 'Nutrition facts',
                      listTitle: convertNuttoTitle(widget.data.recipe.nutritions),
                      sub: convertNuttoSub(widget.data.recipe.nutritions),
                      trail: convertNuttoTrail(widget.data.recipe.nutritions),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  // Map<String, Map<String,Object>> generateNutrientData(List<Nutrition> nut){
  //   Map<String, Map<String,Object>> test = {};
  //   for(var i in nut){
  //     var temp = {"amount": i.quantity, "unit": i.unit};
  //     test[i.key] = temp;
  //   }
  //   print(">>> ${test}");
  //   return test;
  // }

  List<String> convertNuttoTitle(List<Nutrition> nut){
    List<String> nutList = [];
    for (var i in nut) {
      nutList.add(i.label);
    }
    return nutList;
  }
  List<String> convertNuttoSub(List<Nutrition> nut){
    List<String> nutList = [];
    for (var i in nut) {
      nutList.add("${i.quantity.toStringAsFixed(3)} ${i.unit}");
    }
    return nutList;
  }
  List<String> convertNuttoTrail(List<Nutrition> nut){
    List<String> nutList = [];
    for (var i in nut) {
      nutList.add("Scientific Label: ${i.key}");
    }
    return nutList;
  }
}