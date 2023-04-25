import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<File> localFile() async {
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final pathos = appDocumentsDir.path;
  return File(p.join(pathos, "log.txt"));
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
    debugPrint("android ${logFile.toString()}");
  }
  else if (defaultTargetPlatform == TargetPlatform.iOS){
    debugPrint("IOS ${logFile.toString()}");
  }
  else {
    debugPrint("Other ${logFile.toString()}");
    writetoLog(message, dateTime, logFile);
  }
}



