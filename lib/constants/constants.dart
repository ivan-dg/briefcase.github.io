import 'package:flutter/material.dart';

class Constants {
  static const double paddingH = 60;
  static const double paddingV = 60;

  // Design tokens: ink on warm paper.
  static const Color canvas = Color(0xFFF7F5F0);
  static const Color panel = Color(0xFFEFECE4);
  static const Color ink = Color(0xFF1A1917);
  static const Color accent = Color(0xFF303FAD);
  static final Color inkSecondary = ink.withAlpha(158);
  static final Color hairline = ink.withAlpha(30);

  static const Duration animFast = Duration(milliseconds: 280);

  static const String webpageDocIA = 'https://medico-virtual-a1e7d.web.app/';
  static const String webpagePubs = 'https://pubsco.com/';
  static const String urlAndroidPubs =
      'https://play.google.com/store/apps/details?id=com.disruptive.pubs&hl=en';
  static const String urlIosPubs =
      'https://apps.apple.com/app/pubs/id6670232317';
  static const String urlSqwablWeb = 'https://www.sqwabl.com/';
}
