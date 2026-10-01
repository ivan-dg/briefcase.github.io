import 'dart:async';

import 'package:briefcase/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOptionWidget extends StatefulWidget {
  const TextOptionWidget({
    super.key,
    required this.index,
    required this.title,
    this.onTap,
  });

  final int index;
  final String title;
  final VoidCallback? onTap;

  @override
  State<TextOptionWidget> createState() => _TextOptionWidgetState();
}

class _TextOptionWidgetState extends State<TextOptionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  Timer? _timer;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _timer = Timer(
      Duration(milliseconds: 150 + widget.index * 80),
      _controller.forward,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 800;
    final titleSize = wide ? 32.0 : 23.0;

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero),
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: wide ? 24 : 16),
                  child: Row(
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: Constants.animFast,
                        curve: Curves.easeOutCubic,
                        style: GoogleFonts.spaceMono(
                          fontSize: 12,
                          color: _hovered
                              ? Constants.accent
                              : Constants.inkSecondary,
                        ),
                        child: Text(widget.index.toString().padLeft(2, '0')),
                      ),
                      const Gap(28),
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: _hovered ? 1.0 : 0.0),
                        duration: Constants.animFast,
                        curve: Curves.easeOutCubic,
                        builder: (context, t, child) => Transform.translate(
                          offset: Offset(8 * t, 0),
                          child: child,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title.toUpperCase(),
                              style: GoogleFonts.fraunces(
                                fontSize: titleSize,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                                height: 1.0,
                                color: Constants.ink,
                              ),
                            ),
                            const Gap(6),
                            AnimatedContainer(
                              duration: Constants.animFast,
                              curve: Curves.easeOutCubic,
                              width: _hovered ? 44 : 0,
                              height: 2,
                              color: Constants.ink,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 1, color: Constants.hairline),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
