import 'package:design_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:votar/src/features/theme_switcher/presentation/features.dart';
import 'package:votar/src/localization/localization.dart';

void main() {
  runApp(
    const ProviderScope(
      child: VotarApp(),
    ),
  );
}

class VotarApp extends HookConsumerWidget {
  const VotarApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeSiwtcherControllerPod);
    final loc = ref.watch(appLocalizationsPod);
    final locale = ref.watch(localeStatePod);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      themeMode: themeMode.mode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: ThemeSwitcher(),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(loc.getStarted),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*
Colors

Color(0xff0D0030)
Color(0xff11002C)
Color(0xff290662)
Color(0xff81B2C9)
Color(0xffE8D5B5)
Color(0xffDDABFF)
Color(0xff00C9AA)
Color(0xffFFFADE)
Color(0xffD7E5EC)
Color(0xff357F9C)
Color(0xff9D88B2)
Color(0xffFFF6FF)
Color(0xffFFFADE)

*/