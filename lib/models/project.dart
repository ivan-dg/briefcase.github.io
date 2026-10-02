import 'package:flutter/material.dart';

/// Un proyecto del portafolio. Para agregar uno nuevo basta una entrada más en
/// `lib/data/projects_data.dart` y sus strings en `app_strings.dart`.
class Project {
  const Project({
    required this.id,
    required this.descriptionKey,
    required this.coverImage,
    required this.images,
    this.colorImagesBack = const Color(0xFFEFECE4),
    this.urlWeb,
    this.urlAndroid,
    this.urlApple,
  });

  /// Identificador único: se usa como título, tag del Hero y slug de la ruta.
  final String id;

  /// Clave de la descripción en `app_strings.dart` (es/en).
  final String descriptionKey;

  final String coverImage;
  final List<String> images;
  final Color colorImagesBack;

  final String? urlWeb;
  final String? urlAndroid;
  final String? urlApple;

  /// Ruta web del proyecto, p. ej. `/project/sqwabl`.
  String get route => '/project/${Uri.encodeComponent(id)}';
}
