import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'price_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bitcoin Ticker",
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: Colors.white),
      home: const PriceScreen(),
    );
  }
}
