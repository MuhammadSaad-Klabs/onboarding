import 'package:flutter/material.dart';
import 'package:project1/screens/Welcome/welcome1.dart';
import 'package:project1/screens/Welcome/welcome2.dart';
import 'package:project1/screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome1(),
    );
  }
}
