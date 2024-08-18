import 'package:flutter/material.dart';
import 'package:flutter_assignment/my_controller.dart';
import 'package:flutter_assignment/my_data.dart';
import 'package:get/get.dart';

class ColorDropdownWidget extends StatelessWidget {
  final MyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Obx(() {
        return DropdownButton<String>(
          padding: EdgeInsets.only(left: 10, right: 10),
          icon: Icon(Icons.keyboard_arrow_down),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          underline: SizedBox(),
          value: controller.selectedColor.value,
          isExpanded: true,
          items: MyData.colors.map((String color) {
            return DropdownMenuItem<String>(
              value: color,
              child: Text(color),
            );
          }).toList(),
          onChanged: (newValue) {
            controller.selectedColor.value = newValue!;
          },
        );
      }),
    );
  }
}
