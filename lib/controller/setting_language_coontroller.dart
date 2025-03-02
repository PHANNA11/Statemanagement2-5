import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TraslateLanguege extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initlanguege();
  }

  RxString localCode = 'en'.obs;

  Future initlanguege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    localCode.value = prefs.getString('local_code') ?? 'en';

    update();
    // return english.value;
  }

  switchLanguege({required String localCode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.localCode = localCode.obs;
    await prefs.setString('local_code', this.localCode.value);
    await initlanguege();
  }
}
