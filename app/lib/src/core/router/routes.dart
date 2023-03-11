import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<OtherScreenRoute>(
      path: 'other/:id',
    )
  ],
)
@immutable
class HomeScreenRoute extends GoRouteData {
  static String get name => 'HomeScreenRoute';
  static String get path => '/';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@immutable
class OtherScreenRoute extends GoRouteData {
  static String get name => 'OtherScreenRoute';
  static String get path => 'other/:id';
  final int id;

  const OtherScreenRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OtherScreen(id: id.toString());
  }
}
