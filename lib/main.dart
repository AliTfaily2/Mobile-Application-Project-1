import 'package:flutter/material.dart';
import 'home.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSCI410 Project 1',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
