import 'package:flutter/material.dart';
import 'package:quotes/globals.dart';

import '../../../methods.dart';

class RefreshQuoteButton extends StatelessWidget {
  const RefreshQuoteButton({
    super.key,
    required this.index,
    required this.numberOfQuotes,
  });

  final ValueNotifier<int> index;
  final ValueNotifier<int> numberOfQuotes;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        index.value = randomNumberZeroTo(numberOfQuotes.value - 1);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(getRandomQuote),
          Icon(Icons.refresh),
        ],
      ),
    );
  }
}
