import 'package:flutter/material.dart';

@immutable
class Localization {
  final String contactYou;
  final String provideName;
  final String yourName;
  final String continueLabel;

  const Localization({
    required this.contactYou,
    required this.provideName,
    required this.yourName,
    required this.continueLabel,
  });

  factory Localization.fromJson(Map<String, dynamic> data) => Localization(
        contactYou: data['contactYou'],
        provideName: data['provideName'],
        yourName: data['yourName'],
        continueLabel: data['continueLabel'],
      );
}
