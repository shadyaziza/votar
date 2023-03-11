import 'dart:async';
import 'dart:ui' as ui;

import 'package:caching/utility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}

@Riverpod(keepAlive: true)
class AppLocalizationsController extends _$AppLocalizationsController {
  /// Checks if user has saved a preferred language before, if true load user
  /// choice otherwise load system default
  ///
  @override
  AppLocalizations build() {
    final languageCode = ref.watch(utilityCachePod).cachedLanguage;
    if (languageCode != null) {
      state = lookupAppLocalizations(
        Locale(languageCode),
      );
    } else {
      // 1. initialize from the initial locale
      state = lookupAppLocalizations(ui.window.locale);
      // 2. create an observer to update the state
      final observer = _LocaleObserver((locales) {
        state = lookupAppLocalizations(ui.window.locale);
      });
      // 3. register the observer and dispose it when no longer needed
      final binding = WidgetsBinding.instance;
      binding.addObserver(observer);
      ref.onDispose(() => binding.removeObserver(observer));
      // 4. return the state
    }

    return state;
  }

  /// Sets the locale of choice in memory and then saves it in application
  /// storage by calling [_cache]
  void setLocale(Locale locale) {
    const supportedLocales = AppLocalizations.supportedLocales;

    if (supportedLocales.contains(locale)) {
      state = lookupAppLocalizations(locale);
      _cache(locale);
    }
  }

  void _cache(Locale locale) {
    unawaited(ref.read(utilityCachePod).cacheLanguage(locale: locale));
  }

  /// Helper method to compare other to [state] language name
  ///
  bool isSameLocale(String languageName) =>
      (state as AppLocalizations).localeName == languageName;
}
