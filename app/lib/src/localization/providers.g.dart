// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localeStateHash() => r'1122be689d6ce7480f4386ce30e3298799e02826';

/// See also [LocaleState].
@ProviderFor(LocaleState)
final localeStatePod = NotifierProvider<LocaleState, Locale>.internal(
  LocaleState.new,
  name: r'localeStatePod',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localeStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocaleState = Notifier<Locale>;
String _$appLocalizationsHash() => r'e423a2f8dd3bf75e39ccc9f63e6aed0310001374';

/// See also [appLocalizations].
@ProviderFor(appLocalizations)
final appLocalizationsPod = Provider<dynamic>.internal(
  appLocalizations,
  name: r'appLocalizationsPod',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appLocalizationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppLocalizationsRef = ProviderRef<dynamic>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
