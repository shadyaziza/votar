import 'dart:ui';

extension LocaleX on Locale {
  String get flagCode {
    switch (languageCode) {
      case 'ar':
        return 'SA';
      case 'en':
        return 'GB';
      case 'es':
        return 'ES';
      default:
        throw UnimplementedError('$languageCode is not supported yet');
    }
  }

  String get uiString {
    switch (languageCode) {
      case 'ar':
        return 'العربية';
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        throw UnimplementedError('$languageCode is not supported yet');
    }
  }
}
