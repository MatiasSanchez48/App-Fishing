import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavObserver extends AutoRouterObserver {
  NavObserver(this.onRouteChanged);

  final void Function(String routeName) onRouteChanged;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onRouteChanged(route.settings.name ?? '');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    onRouteChanged(newRoute?.settings.name ?? '');
  }
}
