import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/globals.dart';
import 'package:quotes/providers.dart';

class LoadQuotesButton extends ConsumerWidget {
  final int counter;
  const LoadQuotesButton({
    required this.counter,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        if (counter > maxQuotes) {
          FlushbarHelper.createError(
            message: maxQuotesMessage,
            duration: const Duration(seconds: 3),
          ).show(context);
        } else {
          ref.read(quotesNotifierProvider.notifier).loadQuotes();
        }
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(loadMoreQuotes),
          Icon(Icons.download),
        ],
      ),
    );
  }
}
