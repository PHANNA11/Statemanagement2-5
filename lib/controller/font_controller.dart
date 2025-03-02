import 'package:get/get.dart';

class FontsController extends GetxController {
  List<String> fontList = [
    'PlayfairDisplay-Italic-VariableFont_wght',
    'PlaywriteITModerna-VariableFont_wght',
    'PTSerif-Italic',
    'DancingScript-SemiBold',
    'DancingScript-VariableFont_wght',
    'Freehand-Regular',
    'MoonDance-Regular',
  ];
  RxString? font = 'PlayfairDisplay-Italic-VariableFont_wght'.obs;

  void setFont({required String fontFamily}) {
    font!(fontFamily); //font.value=fontFamily;
    update();
  }
}
