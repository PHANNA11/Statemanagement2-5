import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/home_option_ui.dart';

import 'controller/setting_language_coontroller.dart';
import 'controller/theme_contrller.dart';
import 'model/language_model.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    TraslateLanguege traslateLanguege = Get.put(TraslateLanguege());
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
          translations: LanguageModel(),
          debugShowCheckedModeBanner: false,
          theme: themeController.theme,
          onInit: () async {
            await traslateLanguege.initlanguege();
          },
          home: HomeOptionUi(),
          locale: Locale(
              'en',
              traslateLanguege.localCode.value == 'en'
                  ? 'US'
                  : traslateLanguege.localCode.value == 'KH'
                      ? 'KH'
                      : 'cn'));
    });
  }
}
