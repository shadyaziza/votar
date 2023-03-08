import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// @Riverpod(keepAlive: true)
// AppLocalizations appLocalizations(AppLocalizationsRef ref) {
//   // 1. initialize from the initial locale
//   ref.state = lookupAppLocalizations(ui.window.locale);
//   // 2. create an observer to update the state
//   final observer = _LocaleObserver((locales) {
//     ref.state = lookupAppLocalizations(ui.window.locale);
//   });
//   // 3. register the observer and dispose it when no longer needed
//   final binding = WidgetsBinding.instance;
//   binding.addObserver(observer);
//   ref.onDispose(() => binding.removeObserver(observer));
//   // 4. return the state

//   return ref.state;
// }

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
  @override
  AppLocalizations build() {
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

    return state;
  }

  void setLocale(Locale locale) {
    List<Locale> supportedLocales = AppLocalizations.supportedLocales;

    if (supportedLocales.contains(locale)) {
      state = lookupAppLocalizations(locale);
    }
  }

  String get currentLanguageName => (state as AppLocalizations).localeName;
}
