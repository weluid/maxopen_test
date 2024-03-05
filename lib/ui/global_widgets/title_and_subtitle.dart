import 'package:flutter/material.dart';
import 'package:maxopen_test/utils/extentions.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          style: context.textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
