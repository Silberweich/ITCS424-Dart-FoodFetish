import 'package:flutter/material.dart';
import 'package:food_fetish/app/tabDesc.dart';
import 'package:food_fetish/app/tabNutrition.dart';
import 'package:food_fetish/app/tabCloud.dart';
import 'package:food_fetish/app/recipe_json_convert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_fetish/app/func/logging.dart';

class TabRenderer extends StatefulWidget {
  Hit data;
  String title;

  TabRenderer({Key? key, required this.data, required this.title}) : super(key: key);
  @override
  State<TabRenderer> createState() => _TabRendererState();
}

class _TabRendererState extends State<TabRenderer>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    printLog("User has rendered TAB for: ${widget.title}");
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.article_rounded),
            ),
            Tab(
              icon: Icon(Icons.medical_information_rounded),
            ),
            Tab(
              icon: Icon(Icons.warning_rounded),
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          DescriptionPage(data: widget.data, title: widget.title),
          NutritionPage(data: widget.data, title: widget.title),
          CloudPage(data: widget.data, title: widget.title),
        ],
      ),
    );
  }
}
