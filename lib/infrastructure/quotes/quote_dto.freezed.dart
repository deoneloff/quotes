// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuoteDto _$QuoteDtoFromJson(Map<String, dynamic> json) {
  return _QuoteDto.fromJson(json);
}

/// @nodoc
mixin _$QuoteDto {
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

  /// Serializes this QuoteDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuoteDtoCopyWith<QuoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteDtoCopyWith<$Res> {
  factory $QuoteDtoCopyWith(QuoteDto value, $Res Function(QuoteDto) then) =
      _$QuoteDtoCopyWithImpl<$Res, QuoteDto>;
  @useResult
  $Res call({String id, String author, String quote, int likes});
}

/// @nodoc
class _$QuoteDtoCopyWithImpl<$Res, $Val extends QuoteDto>
    implements $QuoteDtoCopyWith<$Res> {
  _$QuoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? quote = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteDtoImplCopyWith<$Res>
    implements $QuoteDtoCopyWith<$Res> {
  factory _$$QuoteDtoImplCopyWith(
          _$QuoteDtoImpl value, $Res Function(_$QuoteDtoImpl) then) =
      __$$QuoteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String author, String quote, int likes});
}

/// @nodoc
class __$$QuoteDtoImplCopyWithImpl<$Res>
    extends _$QuoteDtoCopyWithImpl<$Res, _$QuoteDtoImpl>
    implements _$$QuoteDtoImplCopyWith<$Res> {
  __$$QuoteDtoImplCopyWithImpl(
      _$QuoteDtoImpl _value, $Res Function(_$QuoteDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? quote = null,
    Object? likes = null,
  }) {
    return _then(_$QuoteDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteDtoImpl extends _QuoteDto {
  const _$QuoteDtoImpl(
      {required this.id,
      required this.author,
      required this.quote,
      this.likes = 0})
      : super._();

  factory _$QuoteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String author;
  @override
  final String quote;
  @override
  @JsonKey()
  final int likes;

  @override
  String toString() {
    return 'QuoteDto(id: $id, author: $author, quote: $quote, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, author, quote, likes);

  /// Create a copy of QuoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteDtoImplCopyWith<_$QuoteDtoImpl> get copyWith =>
      __$$QuoteDtoImplCopyWithImpl<_$QuoteDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteDtoImplToJson(
      this,
    );
  }
}

abstract class _QuoteDto extends QuoteDto {
  const factory _QuoteDto(
      {required final String id,
      required final String author,
      required final String quote,
      final int likes}) = _$QuoteDtoImpl;
  const _QuoteDto._() : super._();

  factory _QuoteDto.fromJson(Map<String, dynamic> json) =
      _$QuoteDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get author;
  @override
  String get quote;
  @override
  int get likes;

  /// Create a copy of QuoteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuoteDtoImplCopyWith<_$QuoteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
