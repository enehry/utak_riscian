import 'package:flutter/material.dart';
import 'package:utak_riscian/services/storage_util.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData themeData;

  ThemeProvider() {
    themeData =
        themeFromStorage == 0 ? classicTheme() : themeData = darkTheme();
  }

  int get themeFromStorage => StorageUtil.getInt('theme');

  void changeTheme() {
    if (themeFromStorage == 0) {
      StorageUtil.putInt('theme', 1);
      themeData = darkTheme();
    } else {
      StorageUtil.putInt('theme', 0);
      themeData = classicTheme();
    }
    notifyListeners();
  }

  ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 70, 70, 70),
        primaryColor: Color(0xFF2D2D2D),
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            color: Color(0xFFE0E0E0).withOpacity(0.9),
            fontFamily: 'Mont',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            color: Color(0xFFE0E0E0),
            fontFamily: 'Mont',
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            color: Color(0xFFE0E0E0),
            fontWeight: FontWeight.w500,
            fontFamily: 'Mont',
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            color: Color(0xFFE0E0E0),
            fontWeight: FontWeight.bold,
            fontFamily: 'Mont',
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF2D2D2D)),
      );

  ThemeData classicTheme() => ThemeData(
        scaffoldBackgroundColor: Color(0xFFfaedcd),
        primaryColor: Color(0xFF283F3B),
        backgroundColor: Color(0xFFfaedcd),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            color: Color(0xFF606C38),
            fontFamily: 'Mont',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            color: Color(0xFFfaedcd),
            fontFamily: 'Mont',
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF283F3B),
            fontFamily: 'Mont',
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,

            fontWeight: FontWeight.w500,
            color: Color(0xFFfaedcd),
            fontFamily: 'Mont',
            // fontFamily: 'Mont',
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF283F3B),
            fontFamily: 'Mont',
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF606C38)),
      );
}
