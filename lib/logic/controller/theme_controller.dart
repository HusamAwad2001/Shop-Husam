import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage getStorage = GetStorage();
  final keyTheme = 'isDark';

  void saveThemeData(bool isDark) {
    getStorage.write(keyTheme, isDark);
  }

  bool getThemeData() {
    return getStorage.read<bool>(keyTheme) ?? false;
  }

  void changesTheme() {
    Get.changeThemeMode(getThemeData() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!getThemeData());
  }

  ThemeMode get getDataTheme =>
      getThemeData() ? ThemeMode.dark : ThemeMode.light;
}
