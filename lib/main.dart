import 'package:flutter/material.dart';
import 'package:kabarnagari/ui/LoginScreen.dart';
import 'package:kabarnagari/ui/SplassScreen.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      home: SplassScreen(),
    );
  }
}





