import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screens/add_contact.dart';
import 'package:platform_converter_app/screens/call_screen.dart';
import 'package:platform_converter_app/screens/data_screen.dart';
import 'package:platform_converter_app/screens/setting_screen.dart';
import 'package:provider/provider.dart';

import '../provider/add_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(tabBar: CupertinoTabBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add),label: 'add'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2),label: 'chat'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),label: 'call'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: 'setting'),
      ],
    ), tabBuilder: (context, index) => screenList[index],);
  }
}

List screenList  = [
  AddContactScreen(),
  DataScreen(),
  CallScreen(),
  SettingScreen(),

];
