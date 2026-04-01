// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeScreenRoute,
    ];

GoRoute get $homeScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'other/:id',
          factory: $OtherScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'create-poll',
          factory: $CreatePollScreenRouteExtension._fromState,
        ),
      ],
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $OtherScreenRouteExtension on OtherScreenRoute {
  static OtherScreenRoute _fromState(GoRouterState state) => OtherScreenRoute(
        id: int.parse(state.params['id']!),
      );

  String get location => GoRouteData.$location(
        '/other/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $CreatePollScreenRouteExtension on CreatePollScreenRoute {
  static CreatePollScreenRoute _fromState(GoRouterState state) => CreatePollScreenRoute();

  String get location => GoRouteData.$location(
    '/create-poll',
  );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
