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
    required String quote,
    @Default(0) int likes,
  }) = _QuoteDto;

  Quote toDomain() {
    return Quote(
      id: id,
      author: author,
      quote: quote,
      likes: likes,
    );
  }

  factory QuoteDto.fromDomain(Quote quote) {
    return QuoteDto(
      id: quote.id,
      author: quote.author,
      quote: quote.quote,
      likes: quote.likes,
    );
  }

  factory QuoteDto.fromApi(Map<String, dynamic> json) {
    final uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
    return QuoteDto(
      id: uniqueId,
      author: json['a'] as String,
      quote: json['q'] as String,
      likes: 0,
    );
  }

  factory QuoteDto.fromJson(Map<String, dynamic> json) =>
      _$QuoteDtoFromJson(json);

  factory QuoteDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    data['id'] = doc.id;
    return QuoteDto.fromJson(data);
  }
}
