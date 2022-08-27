import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mk_football/screens/home_screen.dart';
import 'package:mk_football/uis/cubit/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.exoTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
