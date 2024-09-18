import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/quotes/quotes_notifier.dart';
import 'domain/quotes/i_quotes_repository.dart';
import 'domain/quotes/quote.dart';
import 'infrastructure/quotes/quotes_repository.dart';

//! Firebase Providers

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

//! FireStore Repository Providers (infrastructure layer)

final quotesRepositoryProvider = Provider<IQuotesRepository>(
  (ref) => QuotesRepository(
    ref.watch(firebaseFirestoreProvider),
    ref,
  ),
);

// State Notifier Providers (application layer)

final quotesNotifierProvider =
    StateNotifierProvider<QuotesNotifier, QuotesState>(
  (ref) => QuotesNotifier(
    ref: ref,
    repository: ref.watch(quotesRepositoryProvider),
  ),
);

final loadedQuotesNotifierProvider = StateProvider<List<Quote>>((ref) {
  final productState = ref.watch(quotesNotifierProvider);

  return productState.maybeWhen(
    loaded: (quotes) => quotes,
    orElse: () => [],
  );
});
