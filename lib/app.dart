import 'package:flutter/material.dart';

import 'globals.dart';
import 'presentation/core/router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: appTitle,
      debugShowCheckedModeBanner: false,
    );
  }
}
