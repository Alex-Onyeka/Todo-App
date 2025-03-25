import 'package:flutter/material.dart';
import 'package:todo/pages/home.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        //

        //
        appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            height: 2,
          ),
        ),
        //
        //
        //
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStatePropertyAll(Colors.white),
          side: BorderSide(color: Colors.teal, width: 1.5),
        ),
        //
        //
        //
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(
              backgroundColor: Colors.teal,
              shape: CircleBorder(eccentricity: 0.0),
            ),
      ),
      home: Home(),
    ),
  );
}
