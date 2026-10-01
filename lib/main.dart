import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/lib/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.canvas,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.fraunces(
            fontSize: 62,
            fontWeight: FontWeight.w500,
            letterSpacing: -1,
            height: 1.02,
            color: Constants.ink,
          ),
          titleMedium: GoogleFonts.fraunces(
            fontSize: 46,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
            height: 1.04,
            color: Constants.ink,
          ),
          bodyLarge: GoogleFonts.instrumentSans(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: Constants.ink,
          ),
          bodyMedium: GoogleFonts.instrumentSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.8,
            color: Constants.ink,
          ),
          labelMedium: GoogleFonts.instrumentSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Constants.ink,
          ),
          bodySmall: GoogleFonts.spaceMono(
            fontSize: 12.5,
            height: 1.7,
            color: Constants.inkSecondary,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
