import 'package:briefcase/constants/constants.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({
    super.key,
    this.color = Constants.ink,
  });

  final Color? color;

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.of(context).maybePop(),
          child: Text(
            'IVAN \nGUSTIN \nCO.',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: widget.color,
                ),
          ),
        ),
      ),
    );
  }
}
