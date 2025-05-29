// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_Prefill_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantPrefillResponseModel _$PlantPrefillResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PlantPrefillResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PlantPrefillResponseModel {
  @JsonKey(name: 'type')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'articles')
  @HiveField(1)
  List<ArticleModel> get articles => throw _privateConstructorUsedError;
  @JsonKey(name: 'labels')
  @HiveField(2)
  LabelsModel get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary')
  @HiveField(5)
  String? get summary => throw _privateConstructorUsedError;

  /// Serializes this PlantPrefillResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantPrefillResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantPrefillResponseModelCopyWith<PlantPrefillResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantPrefillResponseModelCopyWith<$Res> {
  factory $PlantPrefillResponseModelCopyWith(PlantPrefillResponseModel value,
          $Res Function(PlantPrefillResponseModel) then) =
      _$PlantPrefillResponseModelCopyWithImpl<$Res, PlantPrefillResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') @HiveField(0) String type,
      @JsonKey(name: 'articles') @HiveField(1) List<ArticleModel> articles,
      @JsonKey(name: 'labels') @HiveField(2) LabelsModel labels,
      @JsonKey(name: 'summary') @HiveField(5) String? summary});

  $LabelsModelCopyWith<$Res> get labels;
}

/// @nodoc
class _$PlantPrefillResponseModelCopyWithImpl<$Res,
        $Val extends PlantPrefillResponseModel>
    implements $PlantPrefillResponseModelCopyWith<$Res> {
  _$PlantPrefillResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantPrefillResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? articles = null,
    Object? labels = null,
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
              as List<ArticleModel>,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as LabelsModel,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PlantPrefillResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LabelsModelCopyWith<$Res> get labels {
    return $LabelsModelCopyWith<$Res>(_value.labels, (value) {
      return _then(_value.copyWith(labels: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlantPrefillResponseModelImplCopyWith<$Res>
    implements $PlantPrefillResponseModelCopyWith<$Res> {
  factory _$$PlantPrefillResponseModelImplCopyWith(
          _$PlantPrefillResponseModelImpl value,
          $Res Function(_$PlantPrefillResponseModelImpl) then) =
      __$$PlantPrefillResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') @HiveField(0) String type,
      @JsonKey(name: 'articles') @HiveField(1) List<ArticleModel> articles,
      @JsonKey(name: 'labels') @HiveField(2) LabelsModel labels,
      @JsonKey(name: 'summary') @HiveField(5) String? summary});

  @override
  $LabelsModelCopyWith<$Res> get labels;
}

/// @nodoc
class __$$PlantPrefillResponseModelImplCopyWithImpl<$Res>
    extends _$PlantPrefillResponseModelCopyWithImpl<$Res,
        _$PlantPrefillResponseModelImpl>
    implements _$$PlantPrefillResponseModelImplCopyWith<$Res> {
  __$$PlantPrefillResponseModelImplCopyWithImpl(
      _$PlantPrefillResponseModelImpl _value,
      $Res Function(_$PlantPrefillResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantPrefillResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? articles = null,
    Object? labels = null,
    Object? summary = freezed,
  }) {
    return _then(_$PlantPrefillResponseModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleModel>,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as LabelsModel,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 12, adapterName: 'PlantPrefillResponseModelAdapter')
class _$PlantPrefillResponseModelImpl extends _PlantPrefillResponseModel {
  _$PlantPrefillResponseModelImpl(
      {@JsonKey(name: 'type') @HiveField(0) required this.type,
      @JsonKey(name: 'articles')
      @HiveField(1)
      required final List<ArticleModel> articles,
      @JsonKey(name: 'labels') @HiveField(2) required this.labels,
      @JsonKey(name: 'summary') @HiveField(5) required this.summary})
      : _articles = articles,
        super._();

  factory _$PlantPrefillResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantPrefillResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  @HiveField(0)
  final String type;
  final List<ArticleModel> _articles;
  @override
  @JsonKey(name: 'articles')
  @HiveField(1)
  List<ArticleModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  @JsonKey(name: 'labels')
  @HiveField(2)
  final LabelsModel labels;
  @override
  @JsonKey(name: 'summary')
  @HiveField(5)
  final String? summary;

  @override
  String toString() {
    return 'PlantPrefillResponseModel(type: $type, articles: $articles, labels: $labels, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantPrefillResponseModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.labels, labels) || other.labels == labels) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type,
      const DeepCollectionEquality().hash(_articles), labels, summary);

  /// Create a copy of PlantPrefillResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantPrefillResponseModelImplCopyWith<_$PlantPrefillResponseModelImpl>
      get copyWith => __$$PlantPrefillResponseModelImplCopyWithImpl<
          _$PlantPrefillResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantPrefillResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PlantPrefillResponseModel extends PlantPrefillResponseModel {
  factory _PlantPrefillResponseModel(
      {@JsonKey(name: 'type') @HiveField(0) required final String type,
      @JsonKey(name: 'articles')
      @HiveField(1)
      required final List<ArticleModel> articles,
      @JsonKey(name: 'labels') @HiveField(2) required final LabelsModel labels,
      @JsonKey(name: 'summary')
      @HiveField(5)
      required final String? summary}) = _$PlantPrefillResponseModelImpl;
  _PlantPrefillResponseModel._() : super._();

  factory _PlantPrefillResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlantPrefillResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  @HiveField(0)
  String get type;
  @override
  @JsonKey(name: 'articles')
  @HiveField(1)
  List<ArticleModel> get articles;
  @override
  @JsonKey(name: 'labels')
  @HiveField(2)
  LabelsModel get labels;
  @override
  @JsonKey(name: 'summary')
  @HiveField(5)
  String? get summary;

  /// Create a copy of PlantPrefillResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantPrefillResponseModelImplCopyWith<_$PlantPrefillResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LabelsModel _$LabelsModelFromJson(Map<String, dynamic> json) {
  return _LabelsModel.fromJson(json);
}

/// @nodoc
mixin _$LabelsModel {
  @JsonKey(name: 'WateringNeed')
  @HiveField(0)
  String get wateringNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'LightNeed')
  @HiveField(1)
  String get lightNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fertilizer')
  @HiveField(2)
  List<String> get fertilizer => throw _privateConstructorUsedError;

  /// Serializes this LabelsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabelsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabelsModelCopyWith<LabelsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelsModelCopyWith<$Res> {
  factory $LabelsModelCopyWith(
          LabelsModel value, $Res Function(LabelsModel) then) =
      _$LabelsModelCopyWithImpl<$Res, LabelsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'WateringNeed') @HiveField(0) String wateringNeed,
      @JsonKey(name: 'LightNeed') @HiveField(1) String lightNeed,
      @JsonKey(name: 'Fertilizer') @HiveField(2) List<String> fertilizer});
}

/// @nodoc
class _$LabelsModelCopyWithImpl<$Res, $Val extends LabelsModel>
    implements $LabelsModelCopyWith<$Res> {
  _$LabelsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabelsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wateringNeed = null,
    Object? lightNeed = null,
    Object? fertilizer = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabelsModelImplCopyWith<$Res>
    implements $LabelsModelCopyWith<$Res> {
  factory _$$LabelsModelImplCopyWith(
          _$LabelsModelImpl value, $Res Function(_$LabelsModelImpl) then) =
      __$$LabelsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'WateringNeed') @HiveField(0) String wateringNeed,
      @JsonKey(name: 'LightNeed') @HiveField(1) String lightNeed,
      @JsonKey(name: 'Fertilizer') @HiveField(2) List<String> fertilizer});
}

/// @nodoc
class __$$LabelsModelImplCopyWithImpl<$Res>
    extends _$LabelsModelCopyWithImpl<$Res, _$LabelsModelImpl>
    implements _$$LabelsModelImplCopyWith<$Res> {
  __$$LabelsModelImplCopyWithImpl(
      _$LabelsModelImpl _value, $Res Function(_$LabelsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LabelsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wateringNeed = null,
    Object? lightNeed = null,
    Object? fertilizer = null,
  }) {
    return _then(_$LabelsModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 14, adapterName: 'LabelsModelAdapter')
class _$LabelsModelImpl extends _LabelsModel {
  _$LabelsModelImpl(
      {@JsonKey(name: 'WateringNeed') @HiveField(0) required this.wateringNeed,
      @JsonKey(name: 'LightNeed') @HiveField(1) required this.lightNeed,
      @JsonKey(name: 'Fertilizer')
      @HiveField(2)
      required final List<String> fertilizer})
      : _fertilizer = fertilizer,
        super._();

  factory _$LabelsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelsModelImplFromJson(json);

  @override
  @JsonKey(name: 'WateringNeed')
  @HiveField(0)
  final String wateringNeed;
  @override
  @JsonKey(name: 'LightNeed')
  @HiveField(1)
  final String lightNeed;
  final List<String> _fertilizer;
  @override
  @JsonKey(name: 'Fertilizer')
  @HiveField(2)
  List<String> get fertilizer {
    if (_fertilizer is EqualUnmodifiableListView) return _fertilizer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fertilizer);
  }

  @override
  String toString() {
    return 'LabelsModel(wateringNeed: $wateringNeed, lightNeed: $lightNeed, fertilizer: $fertilizer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelsModelImpl &&
            (identical(other.wateringNeed, wateringNeed) ||
                other.wateringNeed == wateringNeed) &&
            (identical(other.lightNeed, lightNeed) ||
                other.lightNeed == lightNeed) &&
            const DeepCollectionEquality()
                .equals(other._fertilizer, _fertilizer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wateringNeed, lightNeed,
      const DeepCollectionEquality().hash(_fertilizer));

  /// Create a copy of LabelsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelsModelImplCopyWith<_$LabelsModelImpl> get copyWith =>
      __$$LabelsModelImplCopyWithImpl<_$LabelsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelsModelImplToJson(
      this,
    );
  }
}

abstract class _LabelsModel extends LabelsModel {
  factory _LabelsModel(
      {@JsonKey(name: 'WateringNeed')
      @HiveField(0)
      required final String wateringNeed,
      @JsonKey(name: 'LightNeed') @HiveField(1) required final String lightNeed,
      @JsonKey(name: 'Fertilizer')
      @HiveField(2)
      required final List<String> fertilizer}) = _$LabelsModelImpl;
  _LabelsModel._() : super._();

  factory _LabelsModel.fromJson(Map<String, dynamic> json) =
      _$LabelsModelImpl.fromJson;

  @override
  @JsonKey(name: 'WateringNeed')
  @HiveField(0)
  String get wateringNeed;
  @override
  @JsonKey(name: 'LightNeed')
  @HiveField(1)
  String get lightNeed;
  @override
  @JsonKey(name: 'Fertilizer')
  @HiveField(2)
  List<String> get fertilizer;

  /// Create a copy of LabelsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelsModelImplCopyWith<_$LabelsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return _ArticleModel.fromJson(json);
}

/// @nodoc
mixin _$ArticleModel {
  @JsonKey(name: 'title')
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'link')
  @HiveField(1)
  String get link => throw _privateConstructorUsedError;

  /// Serializes this ArticleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleModelCopyWith<ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleModelCopyWith<$Res> {
  factory $ArticleModelCopyWith(
          ArticleModel value, $Res Function(ArticleModel) then) =
      _$ArticleModelCopyWithImpl<$Res, ArticleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') @HiveField(0) String title,
      @JsonKey(name: 'link') @HiveField(1) String link});
}

/// @nodoc
class _$ArticleModelCopyWithImpl<$Res, $Val extends ArticleModel>
    implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleModel
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
abstract class _$$ArticleModelImplCopyWith<$Res>
    implements $ArticleModelCopyWith<$Res> {
  factory _$$ArticleModelImplCopyWith(
          _$ArticleModelImpl value, $Res Function(_$ArticleModelImpl) then) =
      __$$ArticleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') @HiveField(0) String title,
      @JsonKey(name: 'link') @HiveField(1) String link});
}

/// @nodoc
class __$$ArticleModelImplCopyWithImpl<$Res>
    extends _$ArticleModelCopyWithImpl<$Res, _$ArticleModelImpl>
    implements _$$ArticleModelImplCopyWith<$Res> {
  __$$ArticleModelImplCopyWithImpl(
      _$ArticleModelImpl _value, $Res Function(_$ArticleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
  }) {
    return _then(_$ArticleModelImpl(
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
@JsonSerializable()
@HiveType(typeId: 15, adapterName: 'ArticleModelAdapter')
class _$ArticleModelImpl extends _ArticleModel {
  _$ArticleModelImpl(
      {@JsonKey(name: 'title') @HiveField(0) required this.title,
      @JsonKey(name: 'link') @HiveField(1) required this.link})
      : super._();

  factory _$ArticleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleModelImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  @HiveField(0)
  final String title;
  @override
  @JsonKey(name: 'link')
  @HiveField(1)
  final String link;

  @override
  String toString() {
    return 'ArticleModel(title: $title, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, link);

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleModelImplCopyWith<_$ArticleModelImpl> get copyWith =>
      __$$ArticleModelImplCopyWithImpl<_$ArticleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleModelImplToJson(
      this,
    );
  }
}

abstract class _ArticleModel extends ArticleModel {
  factory _ArticleModel(
          {@JsonKey(name: 'title') @HiveField(0) required final String title,
          @JsonKey(name: 'link') @HiveField(1) required final String link}) =
      _$ArticleModelImpl;
  _ArticleModel._() : super._();

  factory _ArticleModel.fromJson(Map<String, dynamic> json) =
      _$ArticleModelImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  @HiveField(0)
  String get title;
  @override
  @JsonKey(name: 'link')
  @HiveField(1)
  String get link;

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleModelImplCopyWith<_$ArticleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
