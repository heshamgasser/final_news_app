import 'package:flutter/material.dart';
import '../model/sources_model.dart';

class NewsProvider extends ChangeNotifier{
  int selectedSource = 0;
  String sourceId = '';

  void changeSourceIndex ({required int index}){
    if (selectedSource == index) return;
    selectedSource = index;
    // sourceId = sourceName;
    notifyListeners();
  }




  List<Sources> sources = [];





}