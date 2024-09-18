import 'package:flutter/material.dart';
import 'package:quotes/domain/quotes/quote.dart';

class LikedQuotesTable extends StatelessWidget {
  const LikedQuotesTable({
    super.key,
    required this.likedQuotesList,
  });

  final List<Quote> likedQuotesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Quote')),
            DataColumn(label: Text('Likes')),
          ],
          rows: likedQuotesList
              .take(10) // Display only the top 10 quotes
              .map(
                (quote) => DataRow(
                  cells: [
                    DataCell(Text(quote.quote)),
                    DataCell(Text(quote.likes.toString())),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
