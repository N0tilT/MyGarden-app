// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_recognition_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantRecognitionResponseModel _$PlantRecognitionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PlantRecognitionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PlantRecognitionResponseModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PlantRecognitionResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantRecognitionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantRecognitionResponseModelCopyWith<PlantRecognitionResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantRecognitionResponseModelCopyWith<$Res> {
  factory $PlantRecognitionResponseModelCopyWith(
          PlantRecognitionResponseModel value,
          $Res Function(PlantRecognitionResponseModel) then) =
      _$PlantRecognitionResponseModelCopyWithImpl<$Res,
          PlantRecognitionResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title,
      @JsonKey(name: 'description') @HiveField(2) String? description});
}

/// @nodoc
class _$PlantRecognitionResponseModelCopyWithImpl<$Res,
        $Val extends PlantRecognitionResponseModel>
    implements $PlantRecognitionResponseModelCopyWith<$Res> {
  _$PlantRecognitionResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantRecognitionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantRecognitionResponseModelImplCopyWith<$Res>
    implements $PlantRecognitionResponseModelCopyWith<$Res> {
  factory _$$PlantRecognitionResponseModelImplCopyWith(
          _$PlantRecognitionResponseModelImpl value,
          $Res Function(_$PlantRecognitionResponseModelImpl) then) =
      __$$PlantRecognitionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title,
      @JsonKey(name: 'description') @HiveField(2) String? description});
}

/// @nodoc
class __$$PlantRecognitionResponseModelImplCopyWithImpl<$Res>
    extends _$PlantRecognitionResponseModelCopyWithImpl<$Res,
        _$PlantRecognitionResponseModelImpl>
    implements _$$PlantRecognitionResponseModelImplCopyWith<$Res> {
  __$$PlantRecognitionResponseModelImplCopyWithImpl(
      _$PlantRecognitionResponseModelImpl _value,
      $Res Function(_$PlantRecognitionResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantRecognitionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PlantRecognitionResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 11, adapterName: 'PlantRecognitionResponseModelAdapter')
class _$PlantRecognitionResponseModelImpl
    extends _PlantRecognitionResponseModel {
  _$PlantRecognitionResponseModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title,
      @JsonKey(name: 'description') @HiveField(2) required this.description})
      : super._();

  factory _$PlantRecognitionResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlantRecognitionResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String? title;
  @override
  @JsonKey(name: 'description')
  @HiveField(2)
  final String? description;

  @override
  String toString() {
    return 'PlantRecognitionResponseModel(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantRecognitionResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  /// Create a copy of PlantRecognitionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantRecognitionResponseModelImplCopyWith<
          _$PlantRecognitionResponseModelImpl>
      get copyWith => __$$PlantRecognitionResponseModelImplCopyWithImpl<
          _$PlantRecognitionResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantRecognitionResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PlantRecognitionResponseModel
    extends PlantRecognitionResponseModel {
  factory _PlantRecognitionResponseModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title,
          @JsonKey(name: 'description')
          @HiveField(2)
          required final String? description}) =
      _$PlantRecognitionResponseModelImpl;
  _PlantRecognitionResponseModel._() : super._();

  factory _PlantRecognitionResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlantRecognitionResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;
  @override
  @JsonKey(name: 'description')
  @HiveField(2)
  String? get description;

  /// Create a copy of PlantRecognitionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantRecognitionResponseModelImplCopyWith<
          _$PlantRecognitionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
