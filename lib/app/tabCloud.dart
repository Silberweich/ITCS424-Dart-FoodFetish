import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_fetish/app/recipe_json_convert.dart';
import 'package:food_fetish/app/func/logging.dart';

class CloudPage extends StatefulWidget {
  Hit data;
  String title;

  CloudPage({Key? key, required this.data, required this.title}) : super(key: key);

  @override
  _CloudPageState createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
  @override
  Widget build(BuildContext context) {
    printLog("User Access LABEL Page for: ${widget.title}");

    List<Widget> data_list= [];
    //num overall = widget.data.recipe.cautions.length + widget.data.recipe.dietLabels.length + widget.data.recipe.healthLabels.length + 10;

    for (var i in widget.data.recipe.cautions){
      data_list.add(Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 209, 50, 50),
        child: Text(i,
                    style: const TextStyle(
                        color: Color(0xBB000000),
                        fontWeight: FontWeight.bold
                      ),
              )
      ));
    }
    for (var i in widget.data.recipe.dietLabels){
      data_list.add(Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 130, 185, 66),
        child: Text(i,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontWeight: FontWeight.bold
                      ),
              )
      ));
    }
    for (var i in widget.data.recipe.healthLabels){
      data_list.add(Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 79, 81, 197),
        child: Text(i,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold
                    ),
              )
      ));
    }

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              childAspectRatio: 3.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: data_list,
            ),
          ),
        ],
      )
    );
  }
}