import 'package:design_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: VotarApp(),
    ),
  );
}

class VotarApp extends StatelessWidget {
  const VotarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                  ),
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