// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'methods.dart';

void configureWeb() {
  setUrlStrategy(PathUrlStrategy());
  html.window.onBeforeUnload.listen((event) async {
    log('--> Browser event intercepted');
    event.stopImmediatePropagation();
  });
}
