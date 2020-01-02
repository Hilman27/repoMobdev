import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:religi_app/model/feed.dart';
import 'package:religi_app/model/newsfeed.dart';

class JsonCRUD{
  File jsonFile;
  Directory dir;
  String fileName = "myFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  JsonCRUD(){
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) fileContent = json.decode(jsonFile.readAsStringSync());
      print ("Json Path : ${dir.path}");
    });
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value) {
    print("Writing to file!");
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    fileContent = json.decode(jsonFile.readAsStringSync());
    print(fileContent);
  }

  void clearJsonData(){
    print("Clean Data");
    Map<String, dynamic> content = Map<String, dynamic>();
    jsonFile.delete();
    //fileExists=false;
    createFile(content, dir, fileName);
  }

  Map<String,dynamic> readJsonData(){
    fileContent = json.decode(jsonFile.readAsStringSync());    
    print("Test Reading : ${fileContent.length}");
    return fileContent;
  }
  
  
 }