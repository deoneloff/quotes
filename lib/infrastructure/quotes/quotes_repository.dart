import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/quotes/i_quotes_repository.dart';
import '../../domain/quotes/quote.dart';
import '../../domain/quotes/quote_failure.dart';
import '../../globals.dart';
import '../../methods.dart';
import 'quote_dto.dart';

class QuotesRepository implements IQuotesRepository {
  final FirebaseFirestore _firestore;
  final Ref ref;

  QuotesRepository(
    this._firestore,
    this.ref,
  );

  @override
  Stream<Either<QuotesFailure, List<Quote>>> watchAllQuotes() {
    try {
      return _firestore
          .collection(quoteCollection)
          .snapshots()
          .map(
            (snapshot) => right<QuotesFailure, List<Quote>>(
              snapshot.docs
                  .map(
                    (doc) => QuoteDto.fromFirestore(doc).toDomain(),
                  )
                  .toList(),
            ),
          )
          .handleError(
        (e) {
          log(
            'handleError: $e',
          );
          return left(
            const QuotesFailure.unexpected(),
          );
        },
      );
    } on FirebaseException catch (e) {
      log(
        'FirebaseException: ${e.message}',
      );
      return Stream.value(
        left(
          const QuotesFailure.database(),
        ),
      );
    } catch (e) {
      log(
        'Exception: $e',
      );
      return Stream.value(
        left(
          const QuotesFailure.unexpected(),
        ),
      );
    }
  }

  @override
  Future<Either<QuotesFailure, Unit>> updateLikes(String id) async {
    try {
      await _firestore.collection(quoteCollection).doc(id).update({
        'likes': FieldValue.increment(1),
      }).then(
        (value) => right(unit),
      );
      return right(unit);
    } on FirebaseException catch (e) {
      log(
        'FirebaseException: ${e.message}',
      );
      return left(
        const QuotesFailure.database(),
      );
    } catch (e) {
      log(
        'Exception: $e',
      );
      return left(
        const QuotesFailure.unexpected(),
      );
    }
  }
}
