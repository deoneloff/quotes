import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';

@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    required String id,
    required String author,
    required String quote,
    required int likes,
  }) = _Quote;
}
