import 'package:flutter/material.dart';
import 'app/homePage.dart';
import 'package:food_fetish/app/func/logging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

   _MyAppState createState() => _MyAppState();
   
}

class _MyAppState extends State<MyApp>{
  
  @override
  Widget build(BuildContext context) {
    printLog("==Start Session==");
    return MaterialApp(
      title: 'Food Fetish App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(title: 'FoodFetishApp'),
    );
  }
}