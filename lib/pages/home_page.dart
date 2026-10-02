import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/data/projects_data.dart';
import 'package:briefcase/l10n/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Constants.wideBreakpoint) {
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
      for (final (index, project) in projects.indexed)
        TextOptionWidget(
          index: index + 1,
          title: project.id,
          onTap: () => context.push(project.route),
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
