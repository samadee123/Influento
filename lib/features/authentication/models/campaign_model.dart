import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class CampaignModel extends ChangeNotifier {

 List _items = [];

  get items => _items;

 String _currentCategory = "Fashion";

 get currentCategory =>_currentCategory;

 void setCurrentCategory (String category){
  _currentCategory  = category;
  loadItems();
  notifyListeners();
  print('After Notify : $_currentCategory');
 }

 CampaignModel() {
  //loadItems();
 }

 Future<void> loadItems() async {

  late String jsonString;
  if(currentCategory=="Fashion")
  {
   jsonString = await rootBundle.loadString('lib/json/fashion.json');
  }else if(currentCategory=="Fitness"){
   jsonString = await rootBundle.loadString('lib/json/fitness.json');
  }else if(currentCategory=="Travel"){
   jsonString = await rootBundle.loadString('lib/json/travel.json');
  }else if(currentCategory=="Food"){
   jsonString = await rootBundle.loadString('lib/json/food.json');
  }else if(currentCategory=="Beauty"){
   jsonString = await rootBundle.loadString('lib/json/beauty.json');
  }else if(currentCategory=="DIY"){
   jsonString = await rootBundle.loadString('lib/json/diy.json');
  }else {
   print('not category passed');
  }

  //final jsonString = await rootBundle.loadString('lib/json/fashion.json');
  final jsonItems = json.decode(jsonString);

  _items = List.from(jsonItems.map((item) => List<dynamic>.from(jsonItems)));



  notifyListeners();
 }

  
}
