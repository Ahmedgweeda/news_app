import 'package:flutter/material.dart';
import 'package:news_app/layout/news_layout/news_layout.dart';
import 'package:news_app/network/dio/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrangeAccent,
          elevation: 20,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black
      ),
      themeMode: ThemeMode.light,
      home: Directionality(
        textDirection: TextDirection.rtl,
          child: NewsLayout()),

    );
  }
}
