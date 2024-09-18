import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quotes/domain/quotes/quotes_failure.dart';

import '../../domain/quotes/i_quotes_repository.dart';
import '../../domain/quotes/quote.dart';
import '../../methods.dart';

part 'quotes_notifier.freezed.dart';

@freezed
class QuotesState with _$QuotesState {
  const QuotesState._();
  const factory QuotesState.initial() = _Initial;
  const factory QuotesState.loading() = _Loading;
  const factory QuotesState.loaded(List<Quote> quotes) = _Loaded;
  const factory QuotesState.failure(QuotesFailure failure) = _Failure;
}

class QuotesNotifier extends StateNotifier<QuotesState> {
  final IQuotesRepository repository;
  final Ref ref;
  late StreamSubscription _quotesStateChangesSubscription;

  QuotesNotifier({
    required this.repository,
    required this.ref,
  }) : super(const QuotesState.initial()) {
    _quotesStateChangesSubscription = repository.watchAllQuotes().listen(
      (failureOrQuotes) {
        state = failureOrQuotes.fold(
          (failure) => state = QuotesState.failure(failure),
          (quotes) {
            log('${quotes.length} quotes loaded');
            return state = QuotesState.loaded(quotes);
          },
        );
      },
    );
  }

  Future<void> updateLikes(String id) async {
    final failureOrUnit = await repository.updateLikes(id);
    failureOrUnit.fold(
      (failure) => null,
      (unit) => null,
    );
  }

  Future<void> loadQuotes() async {
    final failureOrUnit = await repository.loadQuotes();
    final List<Quote> quotes = failureOrUnit.fold(
      (failure) => [],
      (quotes) => quotes,
    );
    for (final quote in quotes) {
      final uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
      final updatedQuote = quote.copyWith(id: uniqueId);
      log('quote.quote: ${updatedQuote.quote} id: ${updatedQuote.id}');
      await repository.storeQuote(updatedQuote);
    }
  }

  @override
  void dispose() {
    _quotesStateChangesSubscription.cancel();
    super.dispose();
  }
}
