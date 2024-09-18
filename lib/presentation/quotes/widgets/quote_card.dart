import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/domain/quotes/quote.dart';

import '../../../providers.dart';

class QuoteCard extends ConsumerWidget {
  const QuoteCard({
    super.key,
    required this.randomQuote,
  });

  final Quote randomQuote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16.0),
      child: Card(
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
      ),
    );
  }
}
