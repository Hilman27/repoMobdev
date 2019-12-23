import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class JsonCRUD{
  String filename = "FeedData.json";
  String path = "assets/jsons/";
  Directory dir;
  File jsonFile;
  bool fileExists=false;
  bool testBool=false;
  Map<String, dynamic> jsonContent;
  Map<String, dynamic> newContent;
  AssetBundle bundle;


  
  JsonCRUD(){
    //bundle = DefaultAssetBundle.of(context).bundle;
   /*  dir = Directory(path);
    jsonFile = new File(path+filename);//("assets/jsons/");//
    fileExists = jsonFile.existsSync();
    print("Json file " + path+filename + " Is " + fileExists.toString()); */    
    initialize();        
  }

  changeNewContent( Map<String, dynamic> newStuff){
    this.newContent=newStuff;
  }

  initialize(){
    getApplicationDocumentsDirectory().then((Directory directory) {
      print("Init----------");
      testBool =true;
      dir = directory;
      print("dir Test1 : ${dir.path}");
      jsonFile = new File(dir.path + "/" + filename);
        fileExists = jsonFile.existsSync();
      if(fileExists){

      }else{
        writeToJSON();
      }            
      //if (fileExists) jsonContent = json.decode(jsonFile.readAsStringSync());
      
      print("Json file " + dir.path + " Is " + fileExists.toString());
    });
  }

  printstuff(){
    print("----------------");
    print("Test to see ${newContent['user']['name']}");
    print("Test to see ${newContent['event']['eventName']}");
    //print("dir Test2 : ${jsonFile.path}");
    print("Directory : $testBool");
    print("----------------");
  }

  Future<String> loadAsset(String key) async {
    //return await rootBundle.loadStructuredData(key, parser);
  }
  Future<File> writeMethod(String stuff) async {
  final file = jsonFile;
  
  // Write the file.
  return file.writeAsString(stuff);
}

  writeToJSON(){
    //Declare JSON FILE for easier calls
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(jsonContent);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(newContent, dir, filename);
    }
    //this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    //print(fileContent);
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }
 }