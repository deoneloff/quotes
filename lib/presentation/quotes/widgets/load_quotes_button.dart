import 'package:flutter/material.dart';
import 'package:quotes/globals.dart';

import '../../../methods.dart';

class LoadQuotesButton extends StatelessWidget {
  const LoadQuotesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log('Load more quotes');
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
