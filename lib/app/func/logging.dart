import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<File> localFile() async {
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final pathos = appDocumentsDir.path;
  return File(p.join(pathos, "log.txt"));
}

Future<String> localFileDir() async{
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final pathos = appDocumentsDir.path;
  return p.join(pathos, "log.txt");
}

void writetoLog(String message, String time, File logFile){
  try {
    logFile.writeAsString("${time}: ${message}\n", mode: FileMode.append);
  }catch (e){
    debugPrint(e.toString());
  }
}

void printLog(String message) async{
  File logFile = await localFile();
  String dateTime = DateTime.now().toString();

  if (defaultTargetPlatform == TargetPlatform.android){
    debugPrint("Android ${logFile.toString()}");
    writetoLog(message, dateTime, logFile);
  }
  else if (defaultTargetPlatform == TargetPlatform.iOS){
    debugPrint("IOS ${logFile.toString()}");
    writetoLog(message, dateTime, logFile);
  }
  else {
    debugPrint("Other ${logFile.toString()}");
    writetoLog(message, dateTime, logFile);
  }
}

Future<Map<String,dynamic>> getFullLogData() async{
  final File logFile = await localFile();
  final String docDir = await localFileDir();
  final Map<String, dynamic> returnData = {};
  String data = "";

  try {
    data = await logFile.readAsString();
  }catch (e){
    logFile.writeAsString("${DateTime.now().toString()}: Error while generating full log data, ironic\n", mode: FileMode.append);
  }
  
  returnData["dir"] = docDir;
  returnData["log"] = data;

  return returnData;
}


