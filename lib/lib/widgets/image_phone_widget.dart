import 'package:flutter/material.dart';

class ImagePhoneWidget extends StatelessWidget {
  const ImagePhoneWidget({
    super.key,
    required this.height,
    required this.url,
  });

  final double height;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      child: Image.asset(
        height: 540,
        width: 250,
        url,
        fit: BoxFit.fill,
      ),
    );
  }
}
