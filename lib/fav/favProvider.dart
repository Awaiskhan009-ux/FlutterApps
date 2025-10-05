import 'package:flutter/material.dart';

class favProvider with ChangeNotifier{
  
List<int> slectedItem=[];

void addFav(index){
  slectedItem.add(index);
notifyListeners();
}

void removeFav(index){
  slectedItem.remove(index);
  notifyListeners();
}

}