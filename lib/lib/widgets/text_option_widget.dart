import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

class TextOptionWidget extends StatefulWidget {
  const TextOptionWidget({
    super.key,
    required this.title,
    this.subtitle = '',
    this.onTap,
    this.alignment = Alignment.center,
    required this.hFactor,
  });

  final String title;
  final String? subtitle;
  final Function()? onTap;
  final AlignmentGeometry? alignment;
  final double hFactor;

  @override
  State<TextOptionWidget> createState() => _TextOptionWidgetState();
}

class _TextOptionWidgetState extends State<TextOptionWidget> {
  bool _isHovered = false;
  double strokeWidth = 2.0;
  double height = 1.1;
  int duration = 250;

  @override
  Widget build(BuildContext context) {
    final matrix = Matrix4.identity()
      ..setEntry(3, 2, 0.0009) // perspectiva
      ..rotateY(0.8)
      ..rotateX(-0.1);
    final screensize = MediaQuery.sizeOf(context);
    final fontsize = screensize.width * widget.hFactor;
    // final fontsize = screensize.width * 0.075;
    return Transform(
      alignment: widget.alignment,
      transform: matrix, // rotación en el eje Y
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: widget.alignment == Alignment.topLeft
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  StrokeText(
                    text: '/',
                    textStyle: GoogleFonts.kanit(
                      color: Colors.black.withAlpha((0.5 * 255).toInt()),
                      fontSize: 85,
                      fontWeight: FontWeight.w100,
                      height: height,
                    ),
                  ),
                  TweenAnimationBuilder(
                    duration: Duration(milliseconds: duration),
                    tween: ColorTween(
                      begin: Colors.black,
                      end: _isHovered ? Colors.transparent : Colors.black,
                    ),
                    builder:
                        (BuildContext context, dynamic color, Widget? child) {
                      return StrokeText(
                        text: widget.title,
                        textStyle: _isHovered
                            ? GoogleFonts.kanit(
                                color: color,
                                fontSize: fontsize,
                                fontWeight: FontWeight.w900,
                                height: height,
                              )
                            : GoogleFonts.kanit(
                                color: color,
                                fontSize: fontsize,
                                fontWeight: FontWeight.w900,
                                height: height,
                              ),
                        strokeColor: Colors.black,
                        strokeWidth: strokeWidth,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ],
              ),
              Visibility(
                visible: widget.subtitle!.isNotEmpty,
                child: TweenAnimationBuilder<Color?>(
                  duration: Duration(milliseconds: duration),
                  tween: ColorTween(
                    begin: Colors.black,
                    end: _isHovered ? Colors.transparent : Colors.black,
                  ),
                  builder:
                      (BuildContext context, dynamic color, Widget? child) {
                    return StrokeText(
                      text: widget.subtitle!,
                      textStyle: _isHovered
                          ? GoogleFonts.kanit(
                              color: color,
                              fontSize: fontsize,
                              fontWeight: FontWeight.w900,
                              height: height,
                            )
                          : GoogleFonts.kanit(
                              color: color,
                              fontSize: fontsize,
                              fontWeight: FontWeight.w900,
                              height: height,
                            ),
                      strokeColor: Colors.black,
                      strokeWidth: strokeWidth,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
