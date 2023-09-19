import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

Future pushToPage(BuildContext context, String route, [dynamic args]) async =>
    await Navigator.pushNamed(
      context,
      route,
      arguments: args,
    );

Future pushAndReplaceToPage(BuildContext context, String route, [dynamic args]) async {
  await Navigator.pushReplacementNamed(
    context,
    route,
    arguments: args,
  );
}

Future popAllAndPush(BuildContext context, String route, [dynamic args]) async {
  await Navigator.pushNamedAndRemoveUntil(
    context,
    route,
    ModalRoute.withName('/'),
    arguments: args,
  );
}
