import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/l10n/app_strings.dart';
import 'package:briefcase/lib/pages/detail_info_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/name_widget.dart';
import '../widgets/text_option_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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

  Future<void> _launchURL(String url) async {
    final Uri toLaunch = Uri.parse(url);
    if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchEmail() async {
    final Uri toLaunch = Uri.parse(Constants.urlEmail);
    if (!await launchUrl(toLaunch)) {
      throw Exception('Could not launch $toLaunch');
    }
  }

  void _openDetail(DetailInfoPage page) {
    Navigator.push(
      context,
      _FadeThroughRoute<void>(page: page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  List<Widget> _projectRows(BuildContext context) {
    return [
      TextOptionWidget(
        index: 1,
        title: 'sqwabl',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'sqwabl',
            description: L10n.of(context, 'sqwablDescription'),
            coverImage: 'assets/sqwabl_1.png',
            colorImagesBack: const Color(0xff60308f),
            images: const [
              'assets/sqwabl_2.png',
              'assets/sqwabl_5.png',
              'assets/sqwabl_3.png',
              'assets/sqwabl_4.png',
              'assets/sqwabl_6.png',
            ],
            openWebpage: () => _launchURL(Constants.urlSqwablWeb),
          ),
        ),
      ),
      TextOptionWidget(
        index: 2,
        title: 'athlete arcade',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'athlete arcade',
            description: L10n.of(context, 'athleteArcadeDescription'),
            coverImage: 'assets/athl_ar_1.jpg',
            colorImagesBack: const Color(0xff00aa57),
            images: const [
              'assets/athl_ar_5.png',
              'assets/athl_ar_2.png',
              'assets/athl_ar_3.png',
              'assets/athl_ar_4.png',
            ],
          ),
        ),
      ),
      TextOptionWidget(
        index: 3,
        title: 'DOC IA',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'DOC IA',
            description: L10n.of(context, 'docIaDescription'),
            coverImage: 'assets/doctor_ia_1.jpg',
            colorImagesBack: const Color(0xFF00CCFF),
            images: const [
              'assets/doctor_ia_2.png',
              'assets/doctor_ia_3.png',
              'assets/doctor_ia_4.png',
            ],
            openWebpage: () => _launchURL(Constants.webpageDocIA),
          ),
        ),
      ),
      TextOptionWidget(
        index: 4,
        title: 'PUBS',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'PUBS',
            description: L10n.of(context, 'pubsDescription'),
            coverImage: 'assets/bar.webp',
            colorImagesBack: const Color(0XFFE9FB00),
            images: const [
              'assets/pubs_1.png',
              'assets/pubs_2.png',
              'assets/pubs_3.png',
              'assets/pubs_4.png',
            ],
            openWebpage: () => _launchURL(Constants.webpagePubs),
            openAndroid: () => _launchURL(Constants.urlAndroidPubs),
            openApple: () => _launchURL(Constants.urlIosPubs),
          ),
        ),
      ),
      TextOptionWidget(
        index: 5,
        title: 'TRIPPSTER',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'TRIPPSTER',
            description: L10n.of(context, 'trippsterDescription'),
            coverImage: 'assets/trippster_6.png',
            colorImagesBack: const Color(0XFF00C535),
            images: const [
              'assets/trippster_1.png',
              'assets/trippster_3.png',
              'assets/trippster_5.png',
              'assets/trippster_4.png',
              'assets/trippster_2.png',
            ],
          ),
        ),
      ),
      TextOptionWidget(
        index: 6,
        title: 'MEPET',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'MEPET',
            description: L10n.of(context, 'mepetDescription'),
            coverImage: 'assets/mepet_1.png',
            colorImagesBack: const Color(0xFFB9C4FF),
            images: const [
              'assets/mepet_2.png',
              'assets/mepet_3.png',
              'assets/mepet_4.png',
              'assets/mepet_5.png',
            ],
          ),
        ),
      ),
      TextOptionWidget(
        index: 7,
        title: 'CONSULTORIO VIRTUAL',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'CONSULTORIO VIRTUAL',
            description: L10n.of(context, 'consultorioDescription'),
            coverImage: 'assets/cons_virt_1.jpg',
            colorImagesBack: const Color(0XFF2A52A3),
            images: const [
              'assets/cons_virt_2.png',
              'assets/cons_virt_3.png',
              'assets/cons_virt_5.png',
              'assets/cons_virt_4.png',
            ],
          ),
        ),
      ),
    ];
  }

  Widget _metaColumn(BuildContext context) {
    final mono = Theme.of(context).textTheme.bodySmall!;
    return FadeTransition(
      opacity: _animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(L10n.of(context, 'portfolioTitle'), style: mono),
          const Gap(4),
          Text(L10n.of(context, 'role'), style: mono),
          const Gap(24),
          Text(L10n.of(context, 'location'), style: mono),
          const Gap(4),
          _MonoLink(
            label: 'ivandgustin@gmail.com',
            onTap: _launchEmail,
          ),
          const Gap(24),
          _MonoLink(
            label: L10n.of(context, 'linkedinLabel'),
            onTap: () => _launchURL('https://www.linkedin.com/in/ivandgu/'),
          ),
          const Gap(8),
          _MonoLink(
            label: L10n.of(context, 'whatsappLabel'),
            onTap: () => _launchURL(Constants.urlWhatsApp),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingH, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const NameWidget(),
              const Gap(40),
              _metaColumn(context),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: 40, top: 60, right: Constants.paddingH),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _LanguageSelector(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      left: 40, top: 24, bottom: 60, right: Constants.paddingH),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _projectRows(context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: _LanguageSelector(),
            ),
            const Gap(36),
            ..._projectRows(context),
            const Gap(90),
            const NameWidget(),
            const Gap(28),
            _metaColumn(context),
          ],
        ),
      ),
    );
  }
}

class _MonoLink extends StatefulWidget {
  const _MonoLink({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  State<_MonoLink> createState() => _MonoLinkState();
}

class _MonoLinkState extends State<_MonoLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: Constants.animFast,
          curve: Curves.easeOutCubic,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: _hovered ? Constants.accent : Constants.ink,
              ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector();

  @override
  Widget build(BuildContext context) {
    final String current = Localizations.localeOf(context).languageCode;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LangOption(code: 'es', active: current == 'es'),
        const Gap(10),
        _LangOption(code: 'en', active: current == 'en'),
      ],
    );
  }
}

class _LangOption extends StatefulWidget {
  const _LangOption({required this.code, required this.active});

  final String code;
  final bool active;

  @override
  State<_LangOption> createState() => _LangOptionState();
}

class _LangOptionState extends State<_LangOption> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color color = widget.active
        ? Constants.ink
        : (_hovered ? Constants.accent : Constants.inkSecondary);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => appLocale.value = Locale(widget.code),
        child: AnimatedDefaultTextStyle(
          duration: Constants.animFast,
          curve: Curves.easeOutCubic,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
                decoration: widget.active
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
          child: Text(widget.code.toUpperCase()),
        ),
      ),
    );
  }
}

class _FadeThroughRoute<T> extends PageRouteBuilder<T> {
  _FadeThroughRoute({required Widget page})
      : super(
          transitionDuration: const Duration(milliseconds: 450),
          reverseTransitionDuration: const Duration(milliseconds: 380),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );
            return FadeTransition(
              opacity: curved,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.96, end: 1.0).animate(curved),
                child: child,
              ),
            );
          },
        );
}
