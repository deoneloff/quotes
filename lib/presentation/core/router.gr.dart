// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:quotes/presentation/quotes/pages/quotes.dart' as _i1;
import 'package:quotes/presentation/splash/pages/splash.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Quotes.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Quotes(),
      );
    },
    Splash.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Splash(),
      );
    },
  };
}

/// generated route for
/// [_i1.Quotes]
class Quotes extends _i3.PageRouteInfo<void> {
  const Quotes({List<_i3.PageRouteInfo>? children})
      : super(
          Quotes.name,
          initialChildren: children,
        );

  static const String name = 'Quotes';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Splash]
class Splash extends _i3.PageRouteInfo<void> {
  const Splash({List<_i3.PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
