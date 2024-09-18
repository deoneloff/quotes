import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/application/quotes/quotes_notifier.dart';
import 'package:quotes/domain/quotes/quote.dart';
import 'package:quotes/presentation/quotes/widgets/load_quotes_button.dart';

import '../../../methods.dart';
import '../../../providers.dart';
import '../widgets/quote_card.dart';
import '../widgets/refresh_quote_button.dart';

@RoutePage()
class Quotes extends HookConsumerWidget {
  const Quotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(quotesNotifierProvider, (previous, next) {
      next.maybeWhen(
        failure: (failure) {
          log('Failure: $failure');
        },
        orElse: () {},
      );
    });
    int likedQuotes = 0;
    final List<Quote> quotes =
        ref.watch<QuotesState>(quotesNotifierProvider).maybeWhen(
              orElse: () => const [],
              loaded: (quotes) {
                likedQuotes = quotes.where((quote) => quote.likes > 0).length;
                return quotes;
              },
            );

    int randomNumber = 0;
    late Quote randomQuote;
    final index = useState(randomNumber);
    final numberOfQuotes = useState(quotes.length);
    if (quotes.isNotEmpty) {
      randomNumber = Random().nextInt(quotes.length - 1);
      randomQuote = quotes[index.value];
      numberOfQuotes.value = quotes.length;
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (numberOfQuotes.value > 0)
                QuoteCard(randomQuote: randomQuote)
              else
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoadQuotesButton(),
                  const SizedBox(width: 10),
                  RefreshQuoteButton(
                    index: index,
                    numberOfQuotes: numberOfQuotes,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            // Position the text at the bottom right
            bottom: 16.0,
            right: 16.0,
            child: Text(
              'There are currently ${numberOfQuotes.value} quotes available and $likedQuotes are liked.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
