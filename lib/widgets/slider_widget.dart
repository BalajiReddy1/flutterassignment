import 'package:flutter/material.dart';
import 'package:flutter_assignment/my_controller.dart';
import 'package:get/get.dart';

class SliderWidget extends StatelessWidget {
  final MyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double sliderValue;
      switch (controller.speed.value) {
        case 'Slow':
          sliderValue = 0.0;
          break;
        case 'Smooth':
          sliderValue = 1.0;
          break;
        case 'Fast':
          sliderValue = 2.0;
          break;
        default:
          sliderValue = 0.0;
      }

      return Column(
        children: [
          Text(
            controller.speed.value,
            style: TextStyle(color: controller.getSelectedColor()),
          ),
          Slider(
            value: sliderValue,
            min: 0.0,
            max: 2.0,
            divisions: 2,
            activeColor: controller.getSelectedColor(),
            onChanged: (value) {
              if (value == 0.0) {
                controller.speed.value = 'Slow';
              } else if (value == 1.0) {
                controller.speed.value = 'Smooth';
              } else if (value == 2.0) {
                controller.speed.value = 'Fast';
              }
            },
          ),
        ],
      );
    });
  }
}
