import 'package:dartz/dartz.dart';

import 'quote.dart';
import 'quote_failure.dart';

abstract class IQuoteRepository {
  Stream<Either<QuoteFailure, List<Quote>>> watchAllQuotes();
  Future<Either<QuoteFailure, Unit>> updateLikes(Quote quote);
}
