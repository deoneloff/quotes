import 'package:auto_route/auto_route.dart';
import 'package:quotes/globals.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    CustomRoute(
      page: Splash.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: Quotes.page,
      path: quotesPath,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
    ),
  ];
}
