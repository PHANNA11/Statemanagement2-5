import 'package:get/get.dart';
import 'package:statemanagement_proj/view/model/user_model.dart';

class UserListController extends GetxController {
  RxList<UserModel> lists = <UserModel>[].obs;

  Future<void> addUser({required UserModel user}) async {
    lists.add(user);
    update();
  }
}
