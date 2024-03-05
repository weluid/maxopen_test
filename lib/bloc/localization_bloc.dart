import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_test/repository/local_storage.dart';
import '../app.dart';
import '../models/app_domain/localization.dart';

class LocalizationCubit extends Cubit<Localization?> {
  LocalizationCubit() : super(null);

  ///first item always will by default language
  static final List<Locale> _availableLocalizations = [
    const Locale('uk'),
  ];

  List<Locale> get localizationList => _availableLocalizations;

  final _localizations = <Locale, Localization>{};

  Map<Locale, Localization> get localizations => _localizations;

  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  bool get hasCurrentLocale => _currentLocale != null;

  Localization get currentLocalization => _localizations[_currentLocale]!;

  Future<void> init() async {
    final function =
    localizationList.map((locale) => _loadLocalizationFile(locale));
    await Future.wait(function);
    _currentLocale = localizationList.firstWhere(
            (element) => element.languageCode == LocalStorage().currentLocale,
        orElse: () => localizationList.first);
    emit(currentLocalization);
  }

  Future<void> setCurrentLocale(Locale chosenLocale) async {
    final newLanguage = localizationList.firstWhere(
            (element) => element == chosenLocale,
        orElse: () => localizationList.first);
    LocalStorage().setCurrentLocale(newLanguage.languageCode);
    _currentLocale = newLanguage;
    emit(currentLocalization);
  }

  Future<void> _loadLocalizationFile(Locale locale) async {
    final data = await DefaultAssetBundle.of(App.globalContext)
        .loadString('assets/l10n/${locale.languageCode}.json');
    final decodedJson = json.decode(data);
    _localizations[locale] = Localization.fromJson(decodedJson);
  }

  static bool _containsLocale(Locale deviceLocale) {
    return _availableLocalizations.indexWhere((element) =>
        deviceLocale.languageCode.startsWith(element.languageCode)) !=
        -1;
  }

  static Locale? localeListResolutionCallback(
      List<Locale>? deviceLocales, Iterable<Locale> supportedLocales) {
    if (LocalStorage().currentLocale != null) {
      return Locale(LocalStorage().currentLocale!);
    }
    late Locale locale;
    if (_containsLocale(deviceLocales!.first)) {
      locale = deviceLocales.first;
    } else {
      locale = _availableLocalizations.first;
    }
    LocalStorage().setCurrentLocale(locale.languageCode);
    return locale;
  }
}