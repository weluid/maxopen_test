import 'package:flutter/material.dart';

@immutable
class Localization {
  final String welcome;


  const Localization({
    required this.welcome,

  });

  factory Localization.fromJson(Map<String, dynamic> data) =>
      Localization(
        welcome: data['welcome'],

      );
}

