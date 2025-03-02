import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_proj/controller/font_controller.dart';

import '../controller/setting_language_coontroller.dart';
import '../controller/theme_contrller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final fontController = Get.put(FontsController());
  final ThemeController themeController = Get.put(ThemeController());
  TraslateLanguege traslateLanguege = Get.put(TraslateLanguege());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: fontController,
        builder: (contextFont) {
          return Scaffold(
            // backgroundColor: Colors.white70,
            appBar: AppBar(
              title: Text(
                'Settings'.toUpperCase(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: contextFont.font!.value),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThemeWidget(),
                  buildLanguageWidget(),
                  buildFontWidget(fontList: contextFont.fontList),
                ],
              ),
            ),
          );
        });
  }

  Widget buildThemeWidget() {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Theme',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: fontController.font!.value),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mode_night_rounded),
            title: Text(
              'Light/Dark',
              style: TextStyle(fontFamily: fontController.font!.value),
            ),
            trailing: SimpleBuilder(builder: (context) {
              return Switch(
                value: themeController.isDark,
                onChanged: (value) {
                  themeController.changeTheme(value);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildLanguageWidget() {
    return GetBuilder<TraslateLanguege>(
        init: traslateLanguege,
        builder: (context) {
          return Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.language),
                      Text(
                        'languages'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: fontController.font!.value),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      onTap: () {
                        traslateLanguege.switchLanguege(localCode: 'en');
                        Get.updateLocale(const Locale('en', 'US'));
                      },
                      leading: Text('🇬🇧', style: TextStyle(fontSize: 30)),
                      title: Text(
                        'English',
                        style:
                            TextStyle(fontFamily: fontController.font!.value),
                      ),
                      trailing: Icon(
                        Icons.done_outlined,
                        color: Colors.green,
                        size: 18,
                      ),
                    ),
                    Divider(
                      height: 0.2,
                      thickness: 0.4,
                      endIndent: 10,
                      indent: 10,
                    ),
                    ListTile(
                      onTap: () {
                        traslateLanguege.switchLanguege(localCode: 'KH');
                        Get.updateLocale(const Locale('KH', 'KH'));
                      },
                      leading: Text('🇰🇭', style: TextStyle(fontSize: 30)),
                      title: Text(
                        'ខ្មែរ',
                        style:
                            TextStyle(fontFamily: fontController.font!.value),
                      ),
                      trailing: Icon(
                        Icons.done_outlined,
                        color: Colors.green,
                        size: 18,
                      ),
                    ),
                    Divider(
                      height: 0.2,
                      thickness: 0.4,
                      endIndent: 10,
                      indent: 10,
                    ),
                    ListTile(
                      onTap: () {
                        traslateLanguege.switchLanguege(localCode: 'cn');
                        Get.updateLocale(const Locale('cn', 'cn'));
                      },
                      leading: Text('🇨🇳', style: TextStyle(fontSize: 30)),
                      title: Text(
                        '中國人',
                        style:
                            TextStyle(fontFamily: fontController.font!.value),
                      ),
                      trailing: Icon(
                        Icons.done_outlined,
                        color: Colors.green,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget buildFontWidget({List<String>? fontList}) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Fonts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: fontController.font!.value),
            ),
          ),
          Column(
            children: List.generate(
              fontList!.length,
              (index) => Column(
                children: [
                  ListTile(
                    onTap: () =>
                        fontController.setFont(fontFamily: fontList[index]),
                    leading: Icon(Icons.font_download_rounded),
                    title: Text(
                      fontList[index],
                      style: TextStyle(fontFamily: fontList[index]),
                    ),
                    trailing: fontList[index] == fontController.font!.value
                        ? Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 18,
                          )
                        : SizedBox(),
                  ),
                  if (index < fontList.length)
                    Divider(
                      height: 0.2,
                      thickness: 0.4,
                      endIndent: 10,
                      indent: 10,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
