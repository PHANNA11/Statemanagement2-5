import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/counter/counter_controller.dart';
import 'package:statemanagement_proj/counter/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(builder: (contextGetx) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Getx',
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.to(SecondScreen());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => SecondScreen(),
                  //     ));
                },
                child: Text('Next Page'))
          ],
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
