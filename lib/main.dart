import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'configure_web.dart';
import 'firebase_options.dart';
import 'methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureWeb();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
    log('__ Firebase.initializeApp for web succeeded');
  } catch (err) {
    log('__ Firebase.initializeApp for web failed: $err');
  }
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
