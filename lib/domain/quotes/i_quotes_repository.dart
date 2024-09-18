import 'package:dartz/dartz.dart';

import 'quote.dart';
import 'quotes_failure.dart';

abstract class IQuotesRepository {
  Stream<Either<QuotesFailure, List<Quote>>> watchAllQuotes();
  Future<Either<QuotesFailure, Unit>> updateLikes(String id);
  Future<Either<QuotesFailure, List<Quote>>> loadQuotes();
}
