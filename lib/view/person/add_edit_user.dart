import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/controller/user_list_controller.dart';
import 'package:statemanagement_proj/view/model/user_model.dart';

class AddEditUser extends StatelessWidget {
  AddEditUser({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final controller = Get.put(UserListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: GetBuilder<UserListController>(
          init: controller,
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text('Enter Email'),
                        hintText: 'email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        label: Text('Enter user name'),
                        hintText: 'User name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton(
                      color: Colors.blue,
                      child: SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Save'))),
                      onPressed: () {
                        if (emailController.text.isNotEmpty &&
                            nameController.text.isNotEmpty) {
                          controller
                              .addUser(
                                user: UserModel(
                                    email: emailController.text.trim(),
                                    name: nameController.text),
                              )
                              .whenComplete(
                                () => localNotification(
                                    title: 'Success',
                                    body: emailController.text.trim()),
                              );
                        }
                      }),
                )
              ],
            );
          }),
    );
  }

  Future<void> localNotification(
          {required String title, required String body}) async =>
      await Get.dialog(
        CupertinoAlertDialog(
          title: Text(title),
          content: Text('$body added.'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Get.back();
                Get.back();
              },
              child: Text('Okay'),
            )
          ],
        ),
      );
}
