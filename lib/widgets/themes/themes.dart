import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        bodyLarge: const TextStyle(
          color: Color(
            0xff42464D,
          ),
        ),
        bodyMedium: TextStyle(color: Colors.black.withOpacity(.4))),
    scaffoldBackgroundColor: Colors.grey.shade200,
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(
          color: Color(
            0xff42464D,
          ),
        )),
    scaffoldBackgroundColor: const Color.fromARGB(255, 28, 27, 27),
  );
}
