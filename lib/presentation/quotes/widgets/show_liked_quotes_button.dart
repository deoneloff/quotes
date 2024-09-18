import 'package:flutter/material.dart';

import '../../../globals.dart';

class ShowLikedQuotesButton extends StatelessWidget {
  const ShowLikedQuotesButton({
    super.key,
    required this.showLikedQuotes,
  });

  final ValueNotifier<bool> showLikedQuotes;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showLikedQuotes.value = !showLikedQuotes.value;
      },
      child: showLikedQuotes.value
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(dismissLikedQuotesMessage),
                Icon(Icons.close),
              ],
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(showLikedQuotesMessage),
                Icon(Icons.favorite_outline_outlined),
              ],
            ),
    );
  }
}
