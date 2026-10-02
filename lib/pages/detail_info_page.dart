import 'dart:async';

import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/l10n/app_strings.dart';
import 'package:briefcase/models/project.dart';
import 'package:briefcase/widgets/image_phone_widget.dart';
import 'package:briefcase/widgets/project_hero.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/header_phone_widget.dart';
import '../widgets/name_widget.dart';

class DetailInfoPage extends StatefulWidget {
  const DetailInfoPage({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<DetailInfoPage> createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // La portada ya esta decodificada cuando termina la transicion.
    precacheImage(AssetImage(widget.project.coverImage), context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _launch(String url) async {
    final Uri toLaunch = Uri.parse(url);
    if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
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

  (String, String) _splitDescription(String description) {
    final idx = description.indexOf('.');
    if (idx < 0) {
      return (description, '');
    }
    final lede = description.substring(0, idx + 1);
    final rest = description.substring(idx + 1).trim();
    return (lede, rest);
  }

  Widget _fadeFrameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    if (wasSynchronouslyLoaded) {
      return child;
    }
    return AnimatedOpacity(
      opacity: frame == null ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      child: child,
    );
  }

  Widget _parallaxCover({required double height, required double extra}) {
    final double dpr = MediaQuery.devicePixelRatioOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: ListenableBuilder(
          listenable: _scrollController,
          builder: (context, child) {
            double t = _scrollController.hasClients
                ? _scrollController.offset * 0.12
                : 0.0;
            if (t > extra) {
              t = extra;
            }
            if (t < 0.0) {
              t = 0.0;
            }
            return Transform.translate(
              offset: Offset(0, t - extra),
              child: child,
            );
          },
          child: Image.asset(
            widget.project.coverImage,
            width: double.infinity,
            height: height + extra,
            fit: BoxFit.cover,
            cacheWidth: (MediaQuery.sizeOf(context).width * dpr).round(),
            filterQuality: FilterQuality.medium,
            frameBuilder: _fadeFrameBuilder,
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context, {required bool wide}) {
    final (lede, rest) =
        _splitDescription(L10n.of(context, widget.project.descriptionKey));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              lede,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: wide ? 19 : 16.5,
                    height: 1.55,
                  ),
            ),
          ),
        ),
        const Gap(24),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              rest,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: wide ? 16 : 14.5,
                    height: 1.9,
                    color: Constants.ink.withAlpha(210),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagesBand(BuildContext context, {required bool wide}) {
    final images = widget.project.images;
    if (wide) {
      return Container(
        width: double.infinity,
        color: widget.project.colorImagesBack,
        padding: const EdgeInsets.symmetric(vertical: 44),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20,
              children: images
                  .map((image) => ImagePhoneWidget(height: 470, url: image))
                  .toList(),
            ),
          ),
        ),
      );
    }
    return _NarrowImagesCarousel(
      images: images,
      background: widget.project.colorImagesBack,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final project = widget.project;
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        if (project.urlApple != null)
          _StoreButton(
            icon: Icons.apple,
            topLabel: L10n.of(context, 'appStoreTop'),
            bottomLabel: L10n.of(context, 'appStoreBottom'),
            onPressed: () => _launch(project.urlApple!),
          ),
        if (project.urlAndroid != null)
          _StoreButton(
            icon: Icons.android,
            topLabel: L10n.of(context, 'googlePlayTop'),
            bottomLabel: L10n.of(context, 'googlePlayBottom'),
            onPressed: () => _launch(project.urlAndroid!),
          ),
        if (project.urlWeb != null)
          _StoreButton(
            icon: Icons.web,
            topLabel: L10n.of(context, 'webTop'),
            bottomLabel: L10n.of(context, 'webBottom'),
            onPressed: () => _launch(project.urlWeb!),
          ),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
                ProjectHero(title: widget.project.id, detail: true),
                const Gap(36),
                _StaggerIn(
                  order: 0,
                  child: _parallaxCover(height: 420, extra: 48),
                ),
                const Gap(70),
                _StaggerIn(
                  order: 1,
                  child: _buildDescription(context, wide: true),
                ),
                const Gap(70),
              ],
            ),
          ),
          _StaggerIn(
            order: 2,
            child: _buildImagesBand(context, wide: true),
          ),
          const Gap(48),
          _StaggerIn(
            order: 3,
            child: Center(child: _buildActionButtons(context)),
          ),
          const Gap(160),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
                Center(
                  child: ProjectHero(title: widget.project.id, detail: true),
                ),
                const Gap(24),
                _StaggerIn(
                  order: 0,
                  child: _parallaxCover(height: 220, extra: 40),
                ),
                const Gap(44),
                _StaggerIn(
                  order: 1,
                  child: _buildDescription(context, wide: false),
                ),
                const Gap(44),
              ],
            ),
          ),
          _StaggerIn(
            order: 2,
            child: _buildImagesBand(context, wide: false),
          ),
          const Gap(40),
          _StaggerIn(
            order: 3,
            child: Center(child: _buildActionButtons(context)),
          ),
          const Gap(100),
        ],
      ),
    );
  }
}

class _NarrowImagesCarousel extends StatefulWidget {
  const _NarrowImagesCarousel({
    required this.images,
    required this.background,
  });

  final List<String> images;
  final Color background;

  @override
  State<_NarrowImagesCarousel> createState() => _NarrowImagesCarouselState();
}

class _NarrowImagesCarouselState extends State<_NarrowImagesCarousel> {
  late final PageController _pageController;
  double _page = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.78);
    _pageController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (!_pageController.hasClients) {
      return;
    }
    final page = _pageController.page;
    if (page != null && page != _page) {
      setState(() => _page = page);
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_handleScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double imageHeight =
        (screenHeight * 0.62).clamp(320.0, 500.0).toDouble();
    final double pageWidth = screenWidth * _pageController.viewportFraction;
    final double imageWidth = (imageHeight / 2)
        .clamp(140.0, pageWidth - 20)
        .toDouble();
    return Container(
      width: double.infinity,
      color: widget.background,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: imageHeight + 10,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: ImagePhoneWidget(
                      height: imageHeight,
                      width: imageWidth,
                      url: widget.images[index],
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.images.length > 1) ...[
            const Gap(18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                final bool active = (index - _page).abs() < 0.5;
                return AnimatedContainer(
                  duration: Constants.animFast,
                  curve: Curves.easeOutCubic,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active
                        ? Constants.ink
                        : Constants.inkSecondary.withAlpha(120),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ],
        ],
      ),
    );
  }
}

class _StaggerIn extends StatefulWidget {
  const _StaggerIn({required this.order, required this.child});

  final int order;
  final Widget child;

  @override
  State<_StaggerIn> createState() => _StaggerInState();
}

class _StaggerInState extends State<_StaggerIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _timer = Timer(
      Duration(milliseconds: 80 + widget.order * 90),
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
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero),
        ),
        child: widget.child,
      ),
    );
  }
}

class _StoreButton extends StatefulWidget {
  const _StoreButton({
    required this.icon,
    required this.topLabel,
    required this.bottomLabel,
    this.onPressed,
  });

  final IconData icon;
  final String topLabel;
  final String bottomLabel;
  final VoidCallback? onPressed;

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.03 : 1.0,
        duration: Constants.animFast,
        curve: Curves.easeOutCubic,
        child: ElevatedButton.icon(
          icon: Icon(widget.icon, color: Colors.white, size: 30),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.black),
            ),
            minimumSize: const Size(150, 42),
          ),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.topLabel,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                widget.bottomLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
