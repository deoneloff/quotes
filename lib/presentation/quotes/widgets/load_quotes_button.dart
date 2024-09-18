import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/globals.dart';
import 'package:quotes/providers.dart';

import '../../../methods.dart';

class LoadQuotesButton extends ConsumerWidget {
  const LoadQuotesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(quotesNotifierProvider.notifier).loadQuotes();
      },
      child: const Row(
        children: [
          Text(loadMoreQuotes),
          Icon(Icons.download),
        ],
      ),
    );
  }
}
