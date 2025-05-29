// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_prefill_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlantPrefillResponseEntity {
  String get type => throw _privateConstructorUsedError;
  List<ArticleEntity> get articles => throw _privateConstructorUsedError;
  String get wateringNeed => throw _privateConstructorUsedError;
  String get lightNeed => throw _privateConstructorUsedError;
  List<String> get fertilizer => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  /// Create a copy of PlantPrefillResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantPrefillResponseEntityCopyWith<PlantPrefillResponseEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantPrefillResponseEntityCopyWith<$Res> {
  factory $PlantPrefillResponseEntityCopyWith(PlantPrefillResponseEntity value,
          $Res Function(PlantPrefillResponseEntity) then) =
      _$PlantPrefillResponseEntityCopyWithImpl<$Res,
          PlantPrefillResponseEntity>;
  @useResult
  $Res call(
      {String type,
      List<ArticleEntity> articles,
      String wateringNeed,
      String lightNeed,
      List<String> fertilizer,
      String? summary});
}

/// @nodoc
class _$PlantPrefillResponseEntityCopyWithImpl<$Res,
        $Val extends PlantPrefillResponseEntity>
    implements $PlantPrefillResponseEntityCopyWith<$Res> {
  _$PlantPrefillResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantPrefillResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? articles = null,
    Object? wateringNeed = null,
    Object? lightNeed = null,
    Object? fertilizer = null,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      wateringNeed: null == wateringNeed
          ? _value.wateringNeed
          : wateringNeed // ignore: cast_nullable_to_non_nullable
              as String,
      lightNeed: null == lightNeed
          ? _value.lightNeed
          : lightNeed // ignore: cast_nullable_to_non_nullable
              as String,
      fertilizer: null == fertilizer
          ? _value.fertilizer
          : fertilizer // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantPrefillResponseEntityImplCopyWith<$Res>
    implements $PlantPrefillResponseEntityCopyWith<$Res> {
  factory _$$PlantPrefillResponseEntityImplCopyWith(
          _$PlantPrefillResponseEntityImpl value,
          $Res Function(_$PlantPrefillResponseEntityImpl) then) =
      __$$PlantPrefillResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      List<ArticleEntity> articles,
      String wateringNeed,
      String lightNeed,
      List<String> fertilizer,
      String? summary});
}

/// @nodoc
class __$$PlantPrefillResponseEntityImplCopyWithImpl<$Res>
    extends _$PlantPrefillResponseEntityCopyWithImpl<$Res,
        _$PlantPrefillResponseEntityImpl>
    implements _$$PlantPrefillResponseEntityImplCopyWith<$Res> {
  __$$PlantPrefillResponseEntityImplCopyWithImpl(
      _$PlantPrefillResponseEntityImpl _value,
      $Res Function(_$PlantPrefillResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantPrefillResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? articles = null,
    Object? wateringNeed = null,
    Object? lightNeed = null,
    Object? fertilizer = null,
    Object? summary = freezed,
  }) {
    return _then(_$PlantPrefillResponseEntityImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      wateringNeed: null == wateringNeed
          ? _value.wateringNeed
          : wateringNeed // ignore: cast_nullable_to_non_nullable
              as String,
      lightNeed: null == lightNeed
          ? _value.lightNeed
          : lightNeed // ignore: cast_nullable_to_non_nullable
              as String,
      fertilizer: null == fertilizer
          ? _value._fertilizer
          : fertilizer // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlantPrefillResponseEntityImpl extends _PlantPrefillResponseEntity {
  const _$PlantPrefillResponseEntityImpl(
      {required this.type,
      required final List<ArticleEntity> articles,
      required this.wateringNeed,
      required this.lightNeed,
      required final List<String> fertilizer,
      required this.summary})
      : _articles = articles,
        _fertilizer = fertilizer,
        super._();

  @override
  final String type;
  final List<ArticleEntity> _articles;
  @override
  List<ArticleEntity> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final String wateringNeed;
  @override
  final String lightNeed;
  final List<String> _fertilizer;
  @override
  List<String> get fertilizer {
    if (_fertilizer is EqualUnmodifiableListView) return _fertilizer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fertilizer);
  }

  @override
  final String? summary;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantPrefillResponseEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.wateringNeed, wateringNeed) ||
                other.wateringNeed == wateringNeed) &&
            (identical(other.lightNeed, lightNeed) ||
                other.lightNeed == lightNeed) &&
            const DeepCollectionEquality()
                .equals(other._fertilizer, _fertilizer) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_articles),
      wateringNeed,
      lightNeed,
      const DeepCollectionEquality().hash(_fertilizer),
      summary);

  /// Create a copy of PlantPrefillResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantPrefillResponseEntityImplCopyWith<_$PlantPrefillResponseEntityImpl>
      get copyWith => __$$PlantPrefillResponseEntityImplCopyWithImpl<
          _$PlantPrefillResponseEntityImpl>(this, _$identity);
}

abstract class _PlantPrefillResponseEntity extends PlantPrefillResponseEntity {
  const factory _PlantPrefillResponseEntity(
      {required final String type,
      required final List<ArticleEntity> articles,
      required final String wateringNeed,
      required final String lightNeed,
      required final List<String> fertilizer,
      required final String? summary}) = _$PlantPrefillResponseEntityImpl;
  const _PlantPrefillResponseEntity._() : super._();

  @override
  String get type;
  @override
  List<ArticleEntity> get articles;
  @override
  String get wateringNeed;
  @override
  String get lightNeed;
  @override
  List<String> get fertilizer;
  @override
  String? get summary;

  /// Create a copy of PlantPrefillResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantPrefillResponseEntityImplCopyWith<_$PlantPrefillResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticleEntity {
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleEntityCopyWith<ArticleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleEntityCopyWith<$Res> {
  factory $ArticleEntityCopyWith(
          ArticleEntity value, $Res Function(ArticleEntity) then) =
      _$ArticleEntityCopyWithImpl<$Res, ArticleEntity>;
  @useResult
  $Res call({String title, String link});
}

/// @nodoc
class _$ArticleEntityCopyWithImpl<$Res, $Val extends ArticleEntity>
    implements $ArticleEntityCopyWith<$Res> {
  _$ArticleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleEntityImplCopyWith<$Res>
    implements $ArticleEntityCopyWith<$Res> {
  factory _$$ArticleEntityImplCopyWith(
          _$ArticleEntityImpl value, $Res Function(_$ArticleEntityImpl) then) =
      __$$ArticleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String link});
}

/// @nodoc
class __$$ArticleEntityImplCopyWithImpl<$Res>
    extends _$ArticleEntityCopyWithImpl<$Res, _$ArticleEntityImpl>
    implements _$$ArticleEntityImplCopyWith<$Res> {
  __$$ArticleEntityImplCopyWithImpl(
      _$ArticleEntityImpl _value, $Res Function(_$ArticleEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
  }) {
    return _then(_$ArticleEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ArticleEntityImpl extends _ArticleEntity {
  const _$ArticleEntityImpl({required this.title, required this.link})
      : super._();

  @override
  final String title;
  @override
  final String link;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, link);

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleEntityImplCopyWith<_$ArticleEntityImpl> get copyWith =>
      __$$ArticleEntityImplCopyWithImpl<_$ArticleEntityImpl>(this, _$identity);
}

abstract class _ArticleEntity extends ArticleEntity {
  const factory _ArticleEntity(
      {required final String title,
      required final String link}) = _$ArticleEntityImpl;
  const _ArticleEntity._() : super._();

  @override
  String get title;
  @override
  String get link;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleEntityImplCopyWith<_$ArticleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
