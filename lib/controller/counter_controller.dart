import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  RxInt number = 0.obs;
  // Increment
  void inCrementNumber() {
    number.value++;
    update();
  }

  // decrement
  void deCrementNumber() {
    number.value--;
    update();
  }
}
