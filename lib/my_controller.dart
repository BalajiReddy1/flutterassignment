import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_data.dart';
import 'my_functions.dart';

class MyController extends GetxController {
  var selectedColor = 'Green'.obs;
  var speed = 'Slow'.obs;
  var totalItems = 1.obs;
  var itemsInLine = 1.obs;

  TextEditingController totalItemsController = TextEditingController();
  TextEditingController itemsInLineController = TextEditingController();

  void updateProgressIndicators() {
    totalItems.value = MyFunctions.parseToInt(totalItemsController.text);
    itemsInLine.value = MyFunctions.parseToInt(itemsInLineController.text);
  }

  Duration getAnimationDuration() {
    switch (speed.value) {
      case 'Slow':
        return Duration(seconds: 4); 
      case 'Smooth':
        return Duration(seconds: 2); 
      case 'Fast':
        return Duration(seconds: 1); 
      default:
        return Duration(seconds: 2); 
    }
  }

  Color getSelectedColor() {
    return MyData.colorMap[selectedColor.value]!;
  }
}
