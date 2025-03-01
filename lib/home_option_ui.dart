import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/counter/home_screen.dart';

import 'view/person/home_list.dart';

class HomeOptionUi extends StatelessWidget {
  const HomeOptionUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU GEXT UI'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 0,
            child: ListTile(
              onTap: () => Get.to(HomeScreen()),
              leading: Icon(
                Icons.app_settings_alt,
                size: 40,
              ),
              title: Text('Counter App'),
              subtitle: Text('Counter app in Getx'),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              onTap: () => Get.to(HomeListUser()),
              leading: Icon(
                Icons.list,
                size: 40,
              ),
              title: Text('List User'),
              subtitle: Text('List ,Model , Getx, Dialog'),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              // onTap: () => Get.to(HomeListUser()),
              leading: Icon(
                Icons.settings_ethernet,
                size: 40,
              ),
              title: Text('Settings'),
              subtitle: Text('Translate, Dark Mode, Fonts'),
            ),
          ),
        ],
      ),
    );
  }
}
