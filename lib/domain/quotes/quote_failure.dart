import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_failure.freezed.dart';

@freezed
class QuoteFailure with _$QuoteFailure {
  const QuoteFailure._();
  const factory QuoteFailure.database() = _Database;
  const factory QuoteFailure.unexpected() = _Unexpected;
}
