import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/features.dart';
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

@TypedGoRoute<OnboardingScreenRoute>(
  path: '/welcome',
)
@immutable
class OnboardingScreenRoute extends GoRouteData {
  static String get name => 'OnboardingScreenRoute';
  static String get path => '/welcome';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingScreen();
  }
}

@TypedGoRoute<CreatePollScreenRoute>(
  path: '/create',
)
@immutable
class CreatePollScreenRoute extends GoRouteData {
  static String get name => 'CreatePollScreenRoute';
  static String get path => '/create';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreatePollScreen();
  }
}

class CreatePollScreen extends StatefulWidget {
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.secondary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.secondary.withOpacity(0.15);
    final Color draggableItemColor = colorScheme.secondary;

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.deepPurpleAccent,
                cursorWidth: 8,
                cursorRadius: Radius.circular(100),
                minLines: 1,
                maxLines: null,
              ),
              Expanded(
                child: ReorderableListView(
                  proxyDecorator: proxyDecorator,
                  children: <Widget>[
                    for (int index = 0; index < _items.length; index += 1)
                      ListTile(
                        key: Key('$index'),
                        // tileColor:
                        //     _items[index].isOdd ? oddItemColor : evenItemColor,
                        title: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              'Option ${index + 1}',
                            ),
                          ),
                        ),
                        trailing: ReorderableDragStartListener(
                          index: index,
                          child: const Icon(Icons.drag_handle),
                        ),
                      ),
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final int item = _items.removeAt(oldIndex);
                      _items.insert(newIndex, item);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
