import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/lib/widgets/image_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

import '../widgets/header_phone_widget.dart';
import '../widgets/name_widget.dart';

class DetailInfoPage extends StatefulWidget {
  const DetailInfoPage({
    super.key,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.images,
    required this.colorBackground,
    required this.colorImagesBack,
    required this.textColor,
  });

  final String title;
  final String description;
  final String coverImage;
  final List<String> images;
  final Color colorBackground;
  final Color colorImagesBack;
  final Color textColor;

  @override
  State<DetailInfoPage> createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        tween: ColorTween(
          begin: Theme.of(context).scaffoldBackgroundColor,
          end: widget.colorBackground,
        ),
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Container(
            color: value,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return _buildWideLayout(context);
                } else {
                  return _buildNarrowLayout(context);
                }
              },
            ),
          );
        },
      ),
    );
  }

  List<String> _splitTextIntoThreeColumns(String text) {
    List<String> paragraphs = text.split('.');
    int totalLength = text.length;
    int currentLength = 0;
    int oneThirdPoint = (totalLength / 3).ceil();
    int twoThirdPoint = (2 * totalLength / 3).ceil();
    int firstSplitIndex = 0;
    int secondSplitIndex = 0;

    for (int i = 0; i < paragraphs.length; i++) {
      currentLength += paragraphs[i].length + 1; // Adding 1 for the period.
      if (currentLength >= oneThirdPoint && firstSplitIndex == 0) {
        firstSplitIndex = i + 1;
      } else if (currentLength >= twoThirdPoint) {
        secondSplitIndex = i + 1;
        break;
      }
    }

    String firstColumn = '${paragraphs.sublist(0, firstSplitIndex).join('.')}.';
    String secondColumn =
        '${paragraphs.sublist(firstSplitIndex, secondSplitIndex).join('.')}.';
    String thirdColumn = '${paragraphs.sublist(secondSplitIndex).join('.')}.';
    return [firstColumn, secondColumn, thirdColumn];
  }

  Widget _buildColumn(String text, {required bool isFirstColumn}) {
    List<String> paragraphs = text.split('.');
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: paragraphs.asMap().entries.map((entry) {
          int idx = entry.key;
          String paragraph = entry.value.trim();
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              paragraph,
              style: (isFirstColumn && idx == 0)
                  ? TextStyle(
                      color: widget.textColor, // Cambia a tu color deseado
                      fontSize: 28,
                    )
                  : TextStyle(
                      color: widget.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      height: 2,
                    ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    List<String> splitText = _splitTextIntoThreeColumns(widget.description);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingH, vertical: 30),
            child: Row(
              children: [
                NameWidget(
                  color: widget.textColor,
                ),
                const Spacer(),
                BackButton(color: widget.textColor),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.coverImage),
              ),
            ),
            height: 300,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Constants.paddingH),
                child: StrokeText(
                  maxLines: 2,
                  text: widget.title.toUpperCase(),
                  textStyle: GoogleFonts.kanit(
                    color: Colors.transparent,
                    fontSize: 120,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                  strokeColor: Colors.white,
                  strokeWidth: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 110, right: 110, top: 80, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColumn(splitText[0], isFirstColumn: true),
                const SizedBox(width: 30),
                _buildColumn(splitText[1], isFirstColumn: false),
                const SizedBox(width: 30),
                _buildColumn(splitText[2], isFirstColumn: false),
              ],
            ),
          ),
          Container(
            color: widget.colorImagesBack,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    widget.images.length,
                    (index) => ImagePhoneWidget(
                      height: 500,
                      url: widget.images[index],
                    ),
                  )),
            ),
          ),
          const Gap(200),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    double height = 500;
    List<String> paragraphs = widget.description.split('.');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderPhoneWidget(
            color: widget.textColor,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.coverImage),
              ),
            ),
            height: 200,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StrokeText(
                  maxLines: 2,
                  text: widget.title.toUpperCase(),
                  textStyle: GoogleFonts.kanit(
                    color: Colors.transparent,
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                  strokeColor: Colors.white,
                  strokeWidth: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.kanit(
                  color: widget.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 2,
                ),
                children: _buildTextSpans(paragraphs),
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            width: double.infinity,
            color: widget.colorImagesBack,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ImagePhoneWidget(
                      height: height,
                      url: widget.images[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(100),
        ],
      ),
    );
  }

  List<TextSpan> _buildTextSpans(List<String> paragraphs) {
    List<TextSpan> textSpans = [];
    for (int i = 0; i < paragraphs.length; i++) {
      if (paragraphs[i].trim().isNotEmpty) {
        textSpans.add(
          TextSpan(
            text: '${paragraphs[i].trim()}.\n\n',
            style: i == 0
                ? GoogleFonts.kanit(
                    color: widget.textColor,
                    fontSize: 22,
                    height: 1.5,
                  )
                : null,
          ),
        );
      }
    }
    return textSpans;
  }
}
