import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';


class JsonCRUD{
  File jsonFile;
  File bookmarkFile;
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
      //print("Feed File : $fileContent ");
      print ("Feed : $fileExists");

      bookmarkFile = new File(dir.path + "/" + bookMarkName);
      print ("Checking Existence");
      bookMarkFileExist = bookmarkFile.existsSync();
      print ("Reading");
      if (bookMarkFileExist) fileContent = json.decode(bookmarkFile.readAsStringSync());
      print("Bookmark File : $fileContent ");
      print ("BookMark : $bookMarkFileExist");
    });
    
  }

  Future<void> reInit() async{
    dir = await getApplicationDocumentsDirectory();
    print("Init Feeds");    
    jsonFile = new File(dir.path + "/" + fileName);
    fileExists = jsonFile.existsSync();
    if (fileExists) fileContent = json.decode(jsonFile.readAsStringSync());
    //print("Feed File : $fileContent ");
    print ("Feed : $fileExists");

    bookmarkFile = new File(dir.path + "/" + bookMarkName);
    print ("Checking Existence");
    bookMarkFileExist = bookmarkFile.existsSync();
    print ("Reading");
    if (bookMarkFileExist) fileContent = json.decode(bookmarkFile.readAsStringSync());
    print("Bookmark File : $fileContent ");
    print ("BookMark : $bookMarkFileExist");

  }

  

  bool verifyFileExsistence(int destination){
    print("Verify");    
    if(destination==0){      
      return fileExists;      
    }else if(destination==1){      
      
      return bookMarkFileExist;
    }
    
  }

  Future<bool> fverifyFileExsistence(int destination) async{
    print("Verify");    
    if(destination==0){     
      //fileExists = await jsonFile.exists(); 
      return fileExists;      
    }else if(destination==1){      
      //bookMarkFileExist = await bookmarkFile.exists();
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
      print("Test Json File : ${jsonfileSelection(destination).path}");
      //print("To be put on Json File : $content");
      Map<String, dynamic> jsonFileContent = json.decode(jsonfileSelection(destination).readAsStringSync());
      jsonFileContent.addAll(content);
      print("To be put on Json File : $jsonFileContent");
      jsonfileSelection(destination).writeAsStringSync(json.encode(jsonFileContent));
    } else {            
      print("File '$fileName' does not exist!");
      createFile(content, dir, nameFileSelection(destination));
    }
    fileContent = json.decode(jsonfileSelection(destination).readAsStringSync());
    print(fileContent);
  }

  void removeFromFile(String key, int destination) {
    print("Deleting key $key from No.$destination!");        
    if (verifyFileExsistence(destination)) {
      print("File exists");
      print("Test Json File : ${jsonfileSelection(destination).path}");
      //print("To be put on Json File : $content");
      Map<String, dynamic> jsonFileContent = json.decode(jsonfileSelection(destination).readAsStringSync());
      jsonFileContent.remove(key);
      print("To be put on Json File : $jsonFileContent");
      jsonfileSelection(destination).writeAsStringSync(json.encode(jsonFileContent));
    } else {            
      print("File '$fileName' does not exist! You can't erase those that doesn't exist!");      
    }
    fileContent = json.decode(jsonfileSelection(destination).readAsStringSync());
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

  Future<Map<String, dynamic>>  fReadJsonData(int source) async {    
    print("Reading Json $source");
    
    //bool exist = await fverifyFileExsistence(source);
    bool exist = await fverifyFileExsistence(source);
    print("Future Read Json");
    if(exist){   
      print("Verified");
      //print("Test file content ${fileContent.keys}");  
      //String temp = await bookmarkFile.readAsString(); 
      fileContent = await json.decode(jsonfileSelection(source).readAsStringSync());    
      print("Test Reading : ${fileContent.length}");
      return Future.value(fileContent);
    }
    
    
  }
  
  File jsonfileSelection(int source){
    if(source==0){
      return jsonFile;
    }else if(source==1){
      return bookmarkFile;
    }
  }

  String nameFileSelection(int source){
    if(source==0){
      return fileName;
    }else if(source==1){
      return bookMarkName;
    }    
  }
  
  
 }