import 'package:dartz/dartz.dart';

import 'quote.dart';
import 'quote_failure.dart';

abstract class IQuotesRepository {
  Stream<Either<QuotesFailure, List<Quote>>> watchAllQuotes();
  Future<Either<QuotesFailure, Unit>> updateLikes(String id);
}
