import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/counter/home_screen.dart';
import 'package:statemanagement_proj/home_option_ui.dart';
import 'package:statemanagement_proj/view/person/home_list.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeOptionUi(),
    );
  }
}
