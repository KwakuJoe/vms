// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
// initalize get storage package here
// store the boolean varioable in box
  final _box = GetStorage();
// since get storage is in key and value pair, we create the key value here
  final _key = 'isDarkmode';

// function to save theme
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

// Is more like assignin the key to false value
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

// switch
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
