import 'package:flutter/material.dart';
import 'Home_Screen.dart';
import 'Detail_Screen.dart';
import 'Profile_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => DetailScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}