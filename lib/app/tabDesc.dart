import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_fetish/app/recipe_json_convert.dart';
import 'package:food_fetish/app/template/recipe_details.dart';
import 'package:food_fetish/app/func/logging.dart';

class DescriptionPage extends StatefulWidget {
  //static const routePath = '/recipe-details';

  Hit data;
  String title;

  DescriptionPage({Key? key, required this.data, required this.title}) : super(key: key);

  @override
  DescriptionPageState createState() => DescriptionPageState();
}

class DescriptionPageState extends State<DescriptionPage>{
  @override
  Widget build(BuildContext context) {
    printLog("User Access NUTRITION Page for: ${widget.title}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.data.recipe.image,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 15.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0.0,
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
                      title: 'Ingredients',
                      listTitle: convertIngtoTxt(widget.data.recipe.ingredients),
                      sub: convertIngtoWeight(widget.data.recipe.ingredients),
                      trail: convertIngtoSumn(widget.data.recipe.ingredients),
                    ),
                    // RecipeDetails(
                    //   title: 'Cooking Instructions',
                    //   recipeInfo: _selectedRecipe.instructions,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> convertIngtoTxt(List<Ingredient> ing){
    List<String> ingList= [];
    for (var i in ing) {
      ingList.add(i.text);
    }
    return ingList;
  }

  List<String> convertIngtoWeight(List<Ingredient> ing){
    List<String> ingList= [];
    for (var i in ing) {
      ingList.add("(${i.weight.toStringAsFixed(3)} grams)");
    }
    return ingList;
  }

  List<String> convertIngtoSumn(List<Ingredient> ing){
    List<String> ingList= [];
    for (var i in ing) {
      ingList.add(i.food);
    }
    return ingList;
  }
}