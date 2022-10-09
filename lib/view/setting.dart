import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_up_ui/theme/Theme_changer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          )
        ],
      ),
    );
  }
}
