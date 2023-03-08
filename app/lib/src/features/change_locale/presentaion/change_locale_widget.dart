import 'package:design_system/flags.dart';
import 'package:design_system/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:votar/src/localization/localization.dart';

class ChangeLocaleWidget extends HookConsumerWidget {
  const ChangeLocaleWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return AppLocalizations.supportedLocales
            .map(
              (Locale locale) => PopupMenuItem(
                onTap: () => ref
                    .read(appLocalizationsControllerPod.notifier)
                    .setLocale(locale),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(locale.languageCode.toUpperCase()),
                    const Spacer(),
                    AppFlag.fromString(locale.flagCode, height: 20, width: 20),
                    const Spacer(),
                    if (locale.languageCode ==
                        ref
                            .read(appLocalizationsControllerPod.notifier)
                            .currentLanguageName) ...{
                      Icon(
                        AppIcons.checkMark,
                        color: Theme.of(context).primaryColor,
                      ),
                    }
                  ],
                ),
              ),
            )
            .toList();
      },
    );
  }
}
