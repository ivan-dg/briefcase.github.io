import 'package:briefcase/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Hero compartido: el titulo de un proyecto viaja entre la fila del home
/// (`detail: false`) y el encabezado de la pagina de detalle (`detail: true`).
class ProjectHero extends StatelessWidget {
  const ProjectHero({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title;
  final bool detail;

  static const String _tagPrefix = 'project-title-';

  static TextStyle _style(bool wide, bool isDetail) {
    if (isDetail) {
      return wide
          ? GoogleFonts.kanit(
              fontSize: 62,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              height: 0.95,
              color: Constants.ink,
            )
          : GoogleFonts.kanit(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              height: 0.95,
              color: Constants.ink,
            );
    }
    return wide
        ? GoogleFonts.kanit(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            height: 1.0,
            color: Constants.ink,
          )
        : GoogleFonts.kanit(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            height: 1.0,
            color: Constants.ink,
          );
  }

  @override
  Widget build(BuildContext context) {
    final bool wide = MediaQuery.sizeOf(context).width > 800;
    return Hero(
      tag: '$_tagPrefix$title',
      flightShuttleBuilder: _flightShuttle,
      child: Text(
        title.toUpperCase(),
        textAlign: detail ? TextAlign.center : TextAlign.start,
        style: _style(wide, detail),
      ),
    );
  }

  static Widget _flightShuttle(
    BuildContext flightContext,
    Animation<double> flightAnimation,
    HeroFlightDirection direction,
    BuildContext fromContext,
    BuildContext toContext,
  ) {
    final bool wide = MediaQuery.sizeOf(flightContext).width > 800;
    final bool toDetail = direction == HeroFlightDirection.push;
    final Hero toHero = toContext.widget as Hero;
    final String flightTitle =
        (toHero.tag as String).replaceFirst(_tagPrefix, '');
    final TextStyle from = _style(wide, !toDetail);
    final TextStyle to = _style(wide, toDetail);
    return AnimatedBuilder(
      animation: flightAnimation,
      builder: (context, _) => Text(
        flightTitle.toUpperCase(),
        textAlign: toDetail ? TextAlign.center : TextAlign.start,
        style: TextStyle.lerp(from, to, flightAnimation.value),
      ),
    );
  }
}
