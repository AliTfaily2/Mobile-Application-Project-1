import 'package:flutter/material.dart';
import 'home.dart';
void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSCI410 Project 1',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
