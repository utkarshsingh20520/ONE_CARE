import 'package:flutter/material.dart';
import '../routes/homePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(Revolution_Wellness());
  Firebase.initializeApp(); 
}

// ignore: camel_case_types
class Revolution_Wellness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('One-Care'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ), 
        ),
      ),
      home: HomePage(),
    );
  }
}
