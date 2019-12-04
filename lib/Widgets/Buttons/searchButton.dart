import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends FloatingActionButton{
  @override
  Widget build(BuildContext context) {    
    return FloatingActionButton(
      child: Icon(Icons.search), 
      onPressed: () {},
    );
  }
  
}