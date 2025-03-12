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
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFF4833FE),
        textTheme: GoogleFonts.kanitTextTheme(
          TextTheme(
            titleMedium: const TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.w800,
              height: 0.75,
            ),
            titleLarge: const TextStyle(
              color: Colors.black,
              fontSize: 85,
              fontWeight: FontWeight.w900,
              height: 0.9,
            ),
            bodySmall: TextStyle(
              fontSize: 14,
              color: Colors.white.withAlpha((0.9 * 255).toInt()),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
