import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/providers.dart';

import '../../../globals.dart';
import '../../../methods.dart';
import '../../core/router.gr.dart';

@RoutePage()
class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    ref.listen(quotesNotifierProvider, (previous, next) {
      next.maybeWhen(
        failure: (failure) {
          log('Failure: $failure');
        },
        loaded: (quotes) {
          Future.delayed(const Duration(seconds: 1), () {
            router.replace(const Quotes());
          });
        },
        orElse: () {},
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logo),
            const Text(
              splashMessage,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
