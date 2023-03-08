import 'dart:ui';

extension LocaleX on Locale {
  String get flagCode {
    switch (languageCode) {
      case 'ar':
        return 'SA';
      case 'en':
        return 'GB';
      default:
        throw UnimplementedError('${languageCode} is not supported yet');
    }
  }
}
