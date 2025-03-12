import 'package:briefcase/lib/widgets/name_widget.dart';
import 'package:flutter/material.dart';

class HeaderPhoneWidget extends StatelessWidget {
  const   HeaderPhoneWidget({
    super.key,
    this.color = Colors.white,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackButton(color: color),
          const Spacer(),
          NameWidget(color: color),
        ],
      ),
    );
  }
}
