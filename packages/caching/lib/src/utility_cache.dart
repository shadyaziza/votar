import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'utility_cache.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

@Riverpod(keepAlive: true)
UtilityCache utilityCache(UtilityCacheRef ref) =>
    UtilityCache(sharedPreferences: ref.read(sharedPreferencesPod));

/// All simple cachable types that do not require secure storage
///
enum Cachable { theme, locale }

/// [UtilityCache] houses all simple caching operations depening on [Cachable] types
///
class UtilityCache {
  UtilityCache({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  /// Helper getter to get saved theme mode
  /// defaults to false = light mode if there is no saved mode
  ///
  bool get isDarkModeEnabled {
    return sharedPreferences.getBool(Cachable.theme.name) ?? false;
  }

  /// Utility function to save dark mode for true and light mode for false
  ///
  void cacheThemeMode({required bool isdark}) {
    sharedPreferences.setBool(Cachable.theme.name, isdark);
  }

  /// Helper getter to get saved language
  /// defaults to null if there is no saved language
  ///
  String? get cachedLanguage {
    return sharedPreferences.getString(Cachable.locale.name);
  }

  /// Utility function to save dark mode for true and light mode for false
  ///
  void cacheLanguage({required Locale locale}) {
    sharedPreferences.setString(Cachable.locale.name, locale.languageCode);
  }
}

/// Global getter to be used in app main function
/// acts as a single instance to [SharedPreferences]
///
Future<SharedPreferences> get sharedPreferencesInstance async =>
    await SharedPreferences.getInstance();
