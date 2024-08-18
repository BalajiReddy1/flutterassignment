import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/my_controller.dart';
import 'package:flutter_assignment/widgets/color_dropdown_widget.dart';
import 'package:flutter_assignment/widgets/progress_indicator_grid.dart';
import 'package:flutter_assignment/widgets/slider_widget.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.network(
              width: 150,
              height: 200,
              'https://static.vecteezy.com/system/resources/previews/029/332/148/large_2x/ai-generative-dj-playing-and-mixing-music-in-nightclub-party-at-night-edm-dance-music-club-with-crowd-of-young-people-free-photo.jpg'),
          Container(width: 350, child: ColorDropdownWidget()),
          Container(width: 350, child: SliderWidget()),
          const SizedBox(height: 10),
          Container(
            width: 350,
            child: Obx(() => TextField(
                  controller: controller.totalItemsController,
                  decoration: InputDecoration(
                    labelText: 'Total Items',
                    labelStyle: TextStyle(color: controller.getSelectedColor()),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: controller.getSelectedColor()),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: controller.getSelectedColor()),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.updateProgressIndicators(),
                )),
          ),
          const SizedBox(height: 12),
          Container(
            width: 350,
            child: Obx(() => TextField(
                  controller: controller.itemsInLineController,
                  decoration: InputDecoration(
                    labelText: 'Items in Line',
                    labelStyle: TextStyle(color: controller.getSelectedColor()),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: controller.getSelectedColor()),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: controller.getSelectedColor()),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.updateProgressIndicators(),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ProgressIndicatorGrid(),
          ),
        ],
      ),
    );
  }
}
