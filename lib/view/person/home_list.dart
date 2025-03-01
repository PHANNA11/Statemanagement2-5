import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/controller/user_list_controller.dart';
import 'package:statemanagement_proj/view/person/add_edit_user.dart';
import 'package:badges/badges.dart' as badges;

class HomeListUser extends StatelessWidget {
  HomeListUser({super.key});
  final controller = Get.put(UserListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListController>(
        init: controller,
        builder: (contexts) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              title: Text('List'),
              centerTitle: true,
              actions: [
                Center(
                  child: badges.Badge(
                    showBadge: controller.lists.isEmpty ? false : true,
                    badgeContent: Text(controller.lists.length.toString()),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            body: ListView.builder(
              itemCount: controller.lists.length,
              itemBuilder: (context, index) => Card(
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    controller.lists[index].name!,
                  ),
                  subtitle: Text(controller.lists[index].email!),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              tooltip: 'add',
              onPressed: () {
                Get.to(AddEditUser());
              },
              label: Text('user'),
              icon: Icon(Icons.person_add_alt),
            ),
          );
        });
  }
}
