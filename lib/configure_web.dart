// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:logging/logging.dart';

void configureWeb() {
  final Logger log = Logger('configureWeb');
  setUrlStrategy(PathUrlStrategy());
  html.window.onBeforeUnload.listen((event) async {
    log.fine('--> Browser event intercepted');
    event.stopImmediatePropagation();
  });
  // html.window.
}
