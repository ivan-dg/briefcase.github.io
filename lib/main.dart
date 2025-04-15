import 'package:briefcase/lib/pages/detail_info_page.dart';
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
      // home: const DetailInfoPage(
      //   textColor: Colors.black,
      //   colorImagesBack: Color(0xFF00CCFF),
      //   colorBackground: Colors.white,
      //   textColorCover: Colors.black,
      //   title: 'DOC IA',
      //   description:
      //       'Bienvenido a Doctor Virtual, tu asistente de salud impulsado por inteligencia artificial. Este chat ha sido diseñado para responder tus preguntas sobre salud, brindarte información confiable y orientarte en temas médicos de manera rápida y accesible. Nuestro objetivo es proporcionarte asesoramiento basado en conocimientos médicos actualizados, ayudándote a comprender síntomas, condiciones y posibles cuidados. Sin embargo, recuerda que Doctor Virtual no sustituye la opinión de un médico profesional,i presentas una emergencia o necesitas un diagnóstico preciso, es fundamental acudir a un especialista. Escríbenos tu consulta y recibe respuestas inmediatas para aclarar dudas sobre bienestar, prevención de enfermedades y hábitos saludables. ¡Tu salud es nuestra prioridad!',
      //   coverImage: 'assets/doctor_ia_1.jpg',
      //   images: [
      //     'assets/doctor_ia_2.png',
      //     'assets/doctor_ia_3.png',
      //     'assets/doctor_ia_4.png',
      //   ],
      // ),
      home: const HomePage(),
    );
  }
}
