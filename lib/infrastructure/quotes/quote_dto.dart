import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/quotes/quote.dart';

part 'quote_dto.freezed.dart';
part 'quote_dto.g.dart';

@freezed
abstract class QuoteDto with _$QuoteDto {
  const QuoteDto._();
  const factory QuoteDto({
    required String id,
    required String author,
    required String category,
    required String quote,
    @Default(0) int likes,
  }) = _QuoteDto;

  Quote toDomain() {
    return Quote(
      id: id,
      author: author,
      category: category,
      quote: quote,
      likes: likes,
    );
  }

  factory QuoteDto.fromDomain(Quote quote) {
    return QuoteDto(
      id: quote.id,
      author: quote.author,
      category: quote.category,
      quote: quote.quote,
      likes: quote.likes,
    );
  }

  factory QuoteDto.fromJson(Map<String, dynamic> json) =>
      _$QuoteDtoFromJson(json);

  factory QuoteDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return QuoteDto.fromJson(data);
  }
}
