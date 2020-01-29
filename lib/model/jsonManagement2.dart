import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:religi_app/model/feed.dart';
import 'package:religi_app/model/newsfeed.dart';

class JsonCRUD2{
  File jsonFile;
  String fileName;
  bool fileExists;
  Map<String, dynamic> fileContent;      
  final int source;
  Map<int,Feed> bookmarksContent;
      
  String feedName = "myFile.json";  
  String bookMarkName = "bookMark.json";  
  
  
  JsonCRUD2._(this.source);

  JsonCRUD2.createnewData(this.source){
    createCrud(source);
  }

  /* static Future<JsonCRUD2> createCrud(int source) async {
    JsonCRUD2 retData = JsonCRUD2._(source);
    await retData.loadContent();
    return retData;
    
  } */

  static Future<JsonCRUD2> createCrud(int source) async {
    JsonCRUD2 retData = JsonCRUD2._(source);
    await retData.loadContent();
    return retData;    
  }

  loadContent() async {
    JsonCRUD2 retData = JsonCRUD2._(source);
    if(source==0){
      fileName=feedName;
    }else if (source==1){
      fileName=bookMarkName;
    }
    Directory dir = await getDir();
    if(await dir.exists()){
      retData.jsonFile = File(dir.path + "/" + fileName);
      retData.fileExists=true;
      return retData;
    }else {
      return null;
    }
  }

  Future<Directory> getDir() async {
    try{
      await getApplicationDocumentsDirectory().then((Directory directory) {
      return directory;
    } );
    } catch(error){
      print("Error : error");      
    }
  }

  
}