import 'package:flutter/material.dart';

class ImagePhoneWidget extends StatelessWidget {
  const ImagePhoneWidget({
    super.key,
    this.height = 540,
    required this.url,
  });

  final double height;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Image.asset(
        height: height,
        width: 250,
        url,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            child: child,
          );
        },
      ),
    );
  }
}
