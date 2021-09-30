// ! Created By DZ-TM071 Open Source Code 🔥🔥 
import 'package:flutter/material.dart';
import 'Pages/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: const RandomUser(),
    );
  }
}
