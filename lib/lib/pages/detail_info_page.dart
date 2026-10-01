import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/lib/widgets/image_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/header_phone_widget.dart';
import '../widgets/name_widget.dart';

class DetailInfoPage extends StatefulWidget {
  const DetailInfoPage({
    super.key,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.images,
    this.openAndroid,
    this.openApple,
    this.openWebpage,
  });

  final String title;
  final String description;
  final String coverImage;
  final List<String> images;
  final VoidCallback? openApple;
  final VoidCallback? openAndroid;
  final VoidCallback? openWebpage;

  @override
  State<DetailInfoPage> createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
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

  (String, String) _splitDescription() {
    final idx = widget.description.indexOf('.');
    if (idx < 0) {
      return (widget.description, '');
    }
    final lede = widget.description.substring(0, idx + 1);
    final rest = widget.description.substring(idx + 1).trim();
    return (lede, rest);
  }

  Widget _buildDescription(BuildContext context, {required bool wide}) {
    final (lede, rest) = _splitDescription();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Text(
            lede,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: wide ? 19 : 16.5,
                  height: 1.55,
                ),
          ),
        ),
        const Gap(24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            rest,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: wide ? 16 : 14.5,
                  height: 1.9,
                  color: Constants.ink.withAlpha(210),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagesBand(BuildContext context, {required bool wide}) {
    if (wide) {
      return Container(
        width: double.infinity,
        color: Constants.panel,
        padding: const EdgeInsets.symmetric(vertical: 44),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20,
              children: widget.images
                  .map((image) => ImagePhoneWidget(height: 470, url: image))
                  .toList(),
            ),
          ),
        ),
      );
    }
    return Container(
      width: double.infinity,
      color: Constants.panel,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      child: Column(
        children: widget.images
            .map(
              (image) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ImagePhoneWidget(height: 500, url: image),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        if (widget.openApple != null)
          _TextArrowButton(label: 'App Store', onTap: widget.openApple),
        if (widget.openAndroid != null)
          _TextArrowButton(label: 'Google Play', onTap: widget.openAndroid),
        if (widget.openWebpage != null)
          _TextArrowButton(label: 'Webpage', onTap: widget.openWebpage),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.paddingH, vertical: 30),
            child: Row(
              children: [
                NameWidget(),
                Spacer(),
                BackButton(color: Constants.ink),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.paddingH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                _RiseIn(
                  child: Text(
                    widget.title.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Gap(36),
                _RiseIn(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      widget.coverImage,
                      width: double.infinity,
                      height: 420,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(70),
                _buildDescription(context, wide: true),
                const Gap(70),
              ],
            ),
          ),
          _buildImagesBand(context, wide: true),
          const Gap(48),
          Center(child: _buildActionButtons(context)),
          const Gap(160),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderPhoneWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Text(
                  widget.title.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 34),
                ),
                const Gap(24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    widget.coverImage,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(44),
                _buildDescription(context, wide: false),
                const Gap(44),
              ],
            ),
          ),
          _buildImagesBand(context, wide: false),
          const Gap(40),
          Center(child: _buildActionButtons(context)),
          const Gap(100),
        ],
      ),
    );
  }
}

class _RiseIn extends StatelessWidget {
  const _RiseIn({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, t, _) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, 14 * (1 - t)),
          child: child,
        ),
      ),
    );
  }
}

class _TextArrowButton extends StatefulWidget {
  const _TextArrowButton({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  State<_TextArrowButton> createState() => _TextArrowButtonState();
}

class _TextArrowButtonState extends State<_TextArrowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Constants.animFast,
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: _hovered ? Constants.ink : Colors.transparent,
            border: Border.all(
              color: _hovered ? Constants.ink : Constants.ink.withAlpha(46),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: Constants.animFast,
                curve: Curves.easeOutCubic,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: _hovered ? Constants.canvas : Constants.ink,
                    ),
                child: Text(widget.label),
              ),
              const Gap(8),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  end: _hovered ? Constants.canvas : Constants.ink,
                ),
                duration: Constants.animFast,
                curve: Curves.easeOutCubic,
                builder: (context, color, child) => Icon(
                  Icons.north_east,
                  size: 14,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
