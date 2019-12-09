import 'package:flutter/cupertino.dart';
import 'package:religi_app/constant/_const.dart';

TextStyle styleMini() {
  return TextStyle(
    fontSize: 7,
    fontWeight: FontWeight.bold,
  );
}

TextStyle styleMini2() {
  return TextStyle(
    fontSize: 5,
    fontWeight: FontWeight.bold,
  );
}

TextStyle styleInput() {
  return TextStyle(
    fontSize: ukuranKecil,
    fontWeight: FontWeight.bold,
    
  );
}

TextStyle normalFont(){
  return TextStyle(
    fontSize: ukuranNormal,
    fontFamily: "calibri",
  );
}

TextStyle smallerFont(){
  return TextStyle(
    fontSize: ukuranKecil,
    fontFamily: "calibri",
  );
}


TextStyle tittleHead(){
  return TextStyle(
    fontSize: 14,
    fontFamily: "Roboto",
    color: textColor,
  );
}

TextStyle tittleHeadWhite(){
  return TextStyle(
    fontSize: 14,
    fontFamily: "Roboto",
    color: putihMain
  );
}

TextStyle tittleSmall(){
  return TextStyle(
    fontSize: 12,
    fontFamily: "Roboto",
    color: textColor,
  );
}

TextStyle feedTitle(){
  return TextStyle(
    fontSize: 18,
    fontFamily: "Roboto",
    color: textColor,
  );
}

TextStyle feedLoc(){
  return TextStyle(
    fontSize: 16,
    fontFamily: "Roboto",
    color: textColor,
  );
}