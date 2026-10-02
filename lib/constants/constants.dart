import 'package:flutter/material.dart';

class Constants {
  static const double paddingH = 60;
  static const double paddingV = 60;

  /// Ancho a partir del cual se usa el layout de escritorio/web.
  static const double wideBreakpoint = 800;

  // Design tokens: ink on warm paper.
  static const Color canvas = Color(0xFFF7F5F0);
  static const Color panel = Color(0xFFEFECE4);
  static const Color ink = Color(0xFF1A1917);
  static const Color accent = Color(0xFF303FAD);
  static final Color inkSecondary = ink.withAlpha(158);
  static final Color hairline = ink.withAlpha(30);

  static const Duration animFast = Duration(milliseconds: 280);

  static const String urlWhatsApp = 'https://wa.me/573195126070';
  static const String urlEmail = 'mailto:ivandgustin@gmail.com';
}
