import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/quotes/i_quotes_repository.dart';
import '../../domain/quotes/quote.dart';
import '../../domain/quotes/quotes_failure.dart';
import '../../globals.dart';
import '../../methods.dart';
import 'quote_dto.dart';

class QuotesRepository implements IQuotesRepository {
  final FirebaseFirestore _firestore;
  final Dio _dio;
  final Ref ref;

  QuotesRepository(
    this.ref,
    this._firestore,
    this._dio,
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

  @override
  Future<Either<QuotesFailure, List<Quote>>> loadQuotes() async {
    try {
      final response = await _dio.post(
        apiUrl,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data is List) {
          final List<Quote> quotes = [];
          final jsonData = response.data as List<dynamic>;
          for (final element in jsonData) {
            if (element is Map<String, dynamic> && element.containsKey('q')) {
              final quoteDto = QuoteDto.fromApi(element);
              final quote = quoteDto.toDomain();
              quotes.add(quote);
            }
          }
          return right(quotes);
        } else {
          final Map<String, dynamic> responseData =
              response.data as Map<String, dynamic>;
          throw Exception(responseData['message']);
        }
      } else {
        throw Exception(
          'Failed to load data, status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      log('DioException: $e');
      return left(const QuotesFailure.api());
    } catch (e) {
      log('Exception: $e');
      return left(const QuotesFailure.unexpected());
    }
  }
}
