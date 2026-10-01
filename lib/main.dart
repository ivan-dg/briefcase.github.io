import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/l10n/app_strings.dart';
import 'package:briefcase/lib/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale?>(
      valueListenable: appLocale,
      builder: (context, manualLocale, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: manualLocale,
          supportedLocales: const [
            Locale('es'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            final Locale? requested = manualLocale ?? deviceLocale;
            if (requested != null) {
              for (final Locale supported in supportedLocales) {
                if (supported.languageCode == requested.languageCode) {
                  Intl.defaultLocale = supported.toString();
                  return supported;
                }
              }
            }
            Intl.defaultLocale = 'es';
            return const Locale('es');
          },
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.canvas,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.kanit(
            fontSize: 62,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
            height: 0.95,
            color: Constants.ink,
          ),
          titleMedium: GoogleFonts.kanit(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            height: 0.75,
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
      },
    );
  }
}
