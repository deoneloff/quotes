import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_failure.freezed.dart';

@freezed
class QuotesFailure with _$QuotesFailure {
  const QuotesFailure._();
  const factory QuotesFailure.database() = _Database;
  const factory QuotesFailure.api() = _Api;
  const factory QuotesFailure.unexpected() = _Unexpected;
}
