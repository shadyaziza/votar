import 'package:caching/utility.dart';
import 'package:design_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/core/logger/logger.dart';
import 'src/core/router/router.dart';
import 'src/features/features.dart';
import 'src/localization/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://srpfdzvxmiejplhjnppi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNycGZkenZ4bWllanBsaGpucHBpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3OTM1NDUzOSwiZXhwIjoxOTk0OTMwNTM5fQ.9XTWkO6-ZsNT7oIa70Dmz5Ae89LnIFsgT1vFtMW81KU',
  );
  final supabase = Supabase.instance.client;
  final sharedPrefInstance = await sharedPreferencesInstance;

  runApp(
    ProviderScope(
      observers: [
        StateObserver(logger: TalkerLogger()),
      ],
      overrides: [
        sharedPreferencesPod.overrideWithValue(sharedPrefInstance),
      ],
      child: const VotarApp(),
    ),
  );
}

class VotarApp extends HookConsumerWidget {
  const VotarApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSiwtcherControllerPod);

    final router = ref.watch(appRouter);

    ref.watch(appLocalizationsControllerPod);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.read(appLocalizationsControllerPod.notifier).currentLocale,
      themeMode: themeMode.mode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
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
