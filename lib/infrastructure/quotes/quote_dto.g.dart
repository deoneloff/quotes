// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteDtoImpl _$$QuoteDtoImplFromJson(Map<String, dynamic> json) =>
    _$QuoteDtoImpl(
      id: json['id'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
      quote: json['quote'] as String,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$QuoteDtoImplToJson(_$QuoteDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'quote': instance.quote,
      'likes': instance.likes,
    };
