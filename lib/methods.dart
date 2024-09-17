import 'package:flutter/foundation.dart';

void log(String message) {
  if (kDebugMode) {
    final timeStamp = DateTime.now().toIso8601String();
    debugPrint('[$timeStamp] $message');
  }
}
