import 'package:flutter/material.dart';
import 'package:planb/screens/geolocation.dart';
import 'package:planb/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resturant Social',
      theme: ThemeData(
        
        primarySwatch: Colors.purple,
      ),

      
      home: WelcomeScreen()
    );
  }
}


