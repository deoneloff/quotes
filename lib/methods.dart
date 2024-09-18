import 'dart:math';

import 'package:flutter/foundation.dart';

void log(String message) {
  if (kDebugMode) {
    final timeStamp = DateTime.now().toIso8601String();
    debugPrint('[$timeStamp] __ $message');
  }
}

int randomNumberZeroTo(int max) {
  return Random().nextInt(max);
}
