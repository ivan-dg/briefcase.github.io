import 'package:briefcase/models/project.dart';
import 'package:flutter/material.dart';

/// Fuente única de proyectos. Agregar un proyecto nuevo = una entrada aquí +
/// sus strings en `app_strings.dart`. Aparece automáticamente en web y mobile.
const List<Project> projects = [
  Project(
    id: 'sqwabl',
    descriptionKey: 'sqwablDescription',
    coverImage: 'assets/sqwabl_1.png',
    colorImagesBack: Color(0xff60308f),
    images: [
      'assets/sqwabl_2.png',
      'assets/sqwabl_5.png',
      'assets/sqwabl_3.png',
      'assets/sqwabl_4.png',
      'assets/sqwabl_6.png',
    ],
    urlWeb: 'https://www.sqwabl.com/',
  ),
  Project(
    id: 'athlete arcade',
    descriptionKey: 'athleteArcadeDescription',
    coverImage: 'assets/athl_ar_1.jpg',
    colorImagesBack: Color(0xff00aa57),
    images: [
      'assets/athl_ar_5.png',
      'assets/athl_ar_2.png',
      'assets/athl_ar_3.png',
      'assets/athl_ar_4.png',
    ],
  ),
  Project(
    id: 'DOC IA',
    descriptionKey: 'docIaDescription',
    coverImage: 'assets/doctor_ia_1.jpg',
    colorImagesBack: Color(0xFF00CCFF),
    images: [
      'assets/doctor_ia_2.png',
      'assets/doctor_ia_3.png',
      'assets/doctor_ia_4.png',
    ],
    urlWeb: 'https://medico-virtual-a1e7d.web.app/',
  ),
  Project(
    id: 'PUBS',
    descriptionKey: 'pubsDescription',
    coverImage: 'assets/bar.webp',
    colorImagesBack: Color(0XFFE9FB00),
    images: [
      'assets/pubs_1.png',
      'assets/pubs_2.png',
      'assets/pubs_3.png',
      'assets/pubs_4.png',
    ],
    urlWeb: 'https://pubsco.com/',
    urlAndroid:
        'https://play.google.com/store/apps/details?id=com.disruptive.pubs&hl=en',
    urlApple: 'https://apps.apple.com/app/pubs/id6670232317',
  ),
  Project(
    id: 'TRIPPSTER',
    descriptionKey: 'trippsterDescription',
    coverImage: 'assets/trippster_6.png',
    colorImagesBack: Color(0XFF00C535),
    images: [
      'assets/trippster_1.png',
      'assets/trippster_3.png',
      'assets/trippster_5.png',
      'assets/trippster_4.png',
      'assets/trippster_2.png',
    ],
  ),
  Project(
    id: 'MEPET',
    descriptionKey: 'mepetDescription',
    coverImage: 'assets/mepet_1.png',
    colorImagesBack: Color(0xFFB9C4FF),
    images: [
      'assets/mepet_2.png',
      'assets/mepet_3.png',
      'assets/mepet_4.png',
      'assets/mepet_5.png',
    ],
  ),
  Project(
    id: 'CONSULTORIO VIRTUAL',
    descriptionKey: 'consultorioDescription',
    coverImage: 'assets/cons_virt_1.jpg',
    colorImagesBack: Color(0XFF2A52A3),
    images: [
      'assets/cons_virt_2.png',
      'assets/cons_virt_3.png',
      'assets/cons_virt_5.png',
      'assets/cons_virt_4.png',
    ],
  ),
];

Project? projectById(String id) {
  for (final project in projects) {
    if (project.id == id) {
      return project;
    }
  }
  return null;
}
