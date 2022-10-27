/* 
import 'package:explore/services/theme_preferences.dart';
import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier{
   bool _isDark; // _isDark is a boolean var that gives the status of the theme.
  ThemePreferences _preferences; // _preferences is an instance var for ThemePreferences class
  bool get isDark => _isDark; 

   ThemeModel() {  // ThemeModel model constructor is to initialize the member var and load theme status from the
 // shared preferences by getPreferences() method
   _isDark = false;
  _preferences = ThemePreferences();
  getPreferences();
}

// switching themes in the flutter app
set isDark (bool value){
  _isDark = value;
  _preferences.setTheme(value);
  notifyListeners();
}

getPreferences() async {  // getPreferences methods load the theme status fromn shared preferences and set it to _isDark
  _isDark = await _preferences.getTheme();
  notifyListeners(); // notifylisteners() methos is to rebuild the ui based on the new value of _isDark 
} 
}

   */