import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeServices {
  GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  ThemeMode get themes =>
      loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!loadThemeFromBox());
  }
}
