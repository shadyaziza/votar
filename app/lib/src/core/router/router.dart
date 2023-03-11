library app_router;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../features/features.dart';
import '../../localization/providers.dart';
import '../logger/logger.dart';
import 'router.dart';

export 'routes.dart';

part 'screens.dart';

final appRouter = Provider<GoRouter>(
  (ref) {
    final notifier = GoRouterNotifier(ref);
    return GoRouter(
      debugLogDiagnostics: true,
      routes: $appRoutes,
      redirect: notifier._redirect,
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );
  },
);

class GoRouterNotifier extends ChangeNotifier {
  final Ref _ref;

  GoRouterNotifier(this._ref) {
    debugPrint(_ref.toString());
    // _ref.listen(authenticationControllerProvider,
    //     (previous, next) => notifyListeners());
  }

  Future<String?> _redirect(context, state) async {
    return null;
  }
}
