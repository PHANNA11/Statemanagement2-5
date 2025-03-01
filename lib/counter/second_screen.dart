import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(builder: (contextGetx) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'SECOND PAGE',
          ),
        ),
        body: Center(
          child: Text(
            contextGetx.number.value.toString(),
            style: TextStyle(fontSize: 26),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.small(
              backgroundColor: Colors.blue,
              shape: CircleBorder(),
              onPressed: () {
                contextGetx.deCrementNumber();
              },
              child: Icon(Icons.remove),
            ),
            FloatingActionButton.small(
              backgroundColor: Colors.blue,
              shape: CircleBorder(),
              onPressed: () {
                contextGetx.inCrementNumber();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      );
    });
  }
}
