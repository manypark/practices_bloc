import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getThemeLight() => ThemeData(
    useMaterial3    : true,
    colorSchemeSeed : Colors.purple,
    brightness      : Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade100,
      hintStyle: const TextStyle( color: Colors.black )
    ),
    textTheme       : const TextTheme(
      bodyMedium  : TextStyle( color : Colors.black ),
      titleLarge  : TextStyle( color : Colors.black, fontSize: 26 ),
      titleMedium : TextStyle( color : Colors.black, fontSize: 22 ),
      titleSmall  : TextStyle( color : Colors.black, fontSize: 18),
    ),

  );

  ThemeData getThemedark() => ThemeData(
    useMaterial3    : true,
    colorSchemeSeed : Colors.purple.shade900,
    brightness      : Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle( color: Colors.white ),
    ),
    textTheme       : const TextTheme(
      bodyMedium: TextStyle( color : Colors.white ),
      titleLarge  : TextStyle( color : Colors.white, fontSize: 26 ),
      titleMedium : TextStyle( color : Colors.white, fontSize: 22 ),
      titleSmall  : TextStyle( color : Colors.white, fontSize: 18 ),
    )
  );

} 