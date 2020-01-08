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
  String feedName = "myFile.json";
  String bookMarkName = "bookMark.json";
  bool fileExists = false;
  bool bookMarkFileExist = false;
  Map<String, dynamic> fileContent;    

  JsonCRUD(){
    getApplicationDocumentsDirectory().then((Directory directory) {
      print("Init Feeds");
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) fileContent = json.decode(jsonFile.readAsStringSync());
      print("Feed File : $fileContent ");
      print ("Feed : $fileExists");
    });
    initToBookmark();
  }

  initToBookmark(){
    print("Init Bookmark");
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + bookMarkName);
      print ("Checking Existence");
      bookMarkFileExist = jsonFile.existsSync();
      print ("Reading");
      if (bookMarkFileExist) fileContent = json.decode(jsonFile.readAsStringSync());
      print("Bookmark File : $fileContent ");
      print ("BookMark : $bookMarkFileExist");
    });
  }  

  bool verifyFileExsistence(int destination){
    print("Verify");    
    if(destination==0){
      print("myfile Exist");
      fileName = feedName; 
      jsonFile = File(dir.path + "/" + fileName);
      return fileExists;      
    }else if(destination==1){
      print("Bookmark Exist");
      fileName = bookMarkName; 
      jsonFile = File(dir.path + "/" + fileName);
      return bookMarkFileExist;
    }
    
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    if(fileName == feedName){
      fileExists = true;
    }else if(fileName == bookMarkName){
      bookMarkFileExist = true;
    }    
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value, int destination) {
    print("Writing to file No.$destination!");    
    Map<String, dynamic> content = {key: value};    
    if (verifyFileExsistence(destination)) {
      print("File exists");
      print("Test Json File : ${jsonFile.path}");
      print("To be put on Json File : $content");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {            
      print("File '$fileName' does not exist!");
      createFile(content, dir, fileName);
    }
    fileContent = json.decode(jsonFile.readAsStringSync());
    print(fileContent);
  }

  void clearJsonData(int destination){ //Only Feed
    print("Clean Data");
    if(verifyFileExsistence(destination)){
      Map<String, dynamic> content = Map<String, dynamic>();
      jsonFile.delete();
      //fileExists=false;
      createFile(content, dir, fileName);
    }
    
  }

  Map<String,dynamic> readJsonData(int source){    
    print("Reading Json $source");
    if(verifyFileExsistence(source)){   
      //print("Test file content ${fileContent.keys}");   
      fileContent = json.decode(jsonFile.readAsStringSync());    
      print("Test Reading : ${fileContent.length}");
      return fileContent;
    }else {
      print("File Does not Exist");
      return null;
    }
    
    
  }

  Future<Map<String,dynamic>> fReadJsonData(int source){    
    print("Reading Json $source");
    if(verifyFileExsistence(source)){   
      //print("Test file content ${fileContent.keys}");   
      fileContent = json.decode(jsonFile.readAsStringSync());    
      print("Test Reading : ${fileContent.length}");
      return Future<Map<String,dynamic>>(()=>fileContent);
    }else {
      print("File Does not Exist");
      return null;
    }
    
    
  }
  
  
 }