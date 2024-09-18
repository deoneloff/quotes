import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/globals.dart';

import '../../methods.dart';
import '../../providers.dart';

class QuotesPage extends HookConsumerWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(quotesNotifierProvider, (previous, next) {});

    final quotesState = ref.watch(quotesNotifierProvider);
    final randomNumber = Random().nextInt(10);
    final index = useState(randomNumber);
    final numberOfQuotes = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: quotesState.when(
          initial: () => const CircularProgressIndicator(),
          loading: () => const CircularProgressIndicator(),
          loaded: (quotes) {
            if (quotes.isEmpty) {
              return const Text('No quotes available.');
            }
            numberOfQuotes.value = quotes.length;
            final randomQuote = quotes[index.value];
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListTile(
                  title: Text(
                    randomQuote.quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    randomQuote.author,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      ref
                          .read(quotesNotifierProvider.notifier)
                          .updateLikes(randomQuote.id);
                    },
                    child: randomQuote.likes > 0
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline_outlined,
                          ),
                  ),
                ),
              ),
            );
          },
          failure: (failure) => Text('Error: $failure'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Refresh',
        onPressed: () {
          index.value = randomNumberZeroTo(numberOfQuotes.value - 1);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
