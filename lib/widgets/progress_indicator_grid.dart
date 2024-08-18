import 'package:flutter/material.dart';
import 'package:flutter_assignment/my_controller.dart';
import 'package:get/get.dart';

class ProgressIndicatorGrid extends StatefulWidget {
  @override
  _ProgressIndicatorGridState createState() => _ProgressIndicatorGridState();
}

class _ProgressIndicatorGridState extends State<ProgressIndicatorGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final MyController _myController = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _myController.getAnimationDuration(),
    )..repeat();
    _myController.speed.listen((_) {
      _controller.duration = _myController.getAnimationDuration();
      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int itemsInLine = _myController.itemsInLine.value;
      int totalItems = _myController.totalItems.value;

      List<Widget> indicators = List.generate(totalItems, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black, width: 2.2),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SizedBox(
                  child: LinearProgressIndicator(
                    value: (_controller.value + (index / totalItems)) % 1.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        _myController.getSelectedColor()),
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(22),
                  ),
                );
              },
            ),
          ),
        );
      });

      return GridView.count(
        crossAxisCount: itemsInLine > 0 ? itemsInLine : 1,
        childAspectRatio: 15,
        children: indicators,
      );
    });
  }
}
