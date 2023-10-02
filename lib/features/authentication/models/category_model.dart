import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class CategoryModel extends ChangeNotifier {

  // List of catogaries 
  final List _categories = [
    //[image , title, color]
    ["lib/images/fashion.jpg","Fashion",Color.fromARGB(255, 168, 168, 168)],
    ["lib/images/fitness.jpg","Fitness",Color.fromARGB(255, 168, 168, 168)],
    ["lib/images/travel.jpeg","Travel",Color.fromARGB(255, 168, 168, 168)],
    ["lib/images/food.jpeg","Food",Color.fromARGB(255, 168, 168, 168)],
    ["lib/images/beauty.jpg","Beauty",Color.fromARGB(255, 168, 168, 168)],
    ["lib/images/diy.jpg","DIY",Color.fromARGB(255, 168, 168, 168)]
  ];

  get categories => _categories;
   
}
