import 'package:flutter/material.dart';
import 'package:food_fetish/app/func/logging.dart';
import 'package:google_fonts/google_fonts.dart';

class LoggingPage extends StatefulWidget {

  LoggingPage({Key? key}) : super(key: key);

  @override
  _LoggingPageState createState() => _LoggingPageState();
}

class _LoggingPageState extends State<LoggingPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("render?");
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Logging Page",
          style: GoogleFonts.robotoCondensed(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: FutureBuilder<Map<String,dynamic>>(
                  future: getFullLogData(),
                  builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot){
                    List<Widget> children;
                    
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: MediaQuery.of(context).size.height * .08,
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(255, 199, 201, 204),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left:5, right:5, top: 5, bottom: 5),
                          child: Text('Reading log from: ${snapshot.data!["dir"]}'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left:5, right:5, top: 5, bottom: 5),
                          child: Text(snapshot.data!["log"]),
                        )
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: MediaQuery.of(context).size.height * .10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ];
                    } else {
                      children = <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.height * .10,
                          height: MediaQuery.of(context).size.height * .10,
                          child: CircularProgressIndicator(),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        ),
                      ];
                    }

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                ),
              ),
            ]
          )
        )
      )
    );
  }
}