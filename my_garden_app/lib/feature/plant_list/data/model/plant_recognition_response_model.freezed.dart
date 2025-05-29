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
  @JsonKey(name: 'message')
  @HiveField(0)
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'filename')
  @HiveField(1)
  String get filename => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'message') @HiveField(0) String message,
      @JsonKey(name: 'filename') @HiveField(1) String filename});
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
    Object? message = null,
    Object? filename = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'message') @HiveField(0) String message,
      @JsonKey(name: 'filename') @HiveField(1) String filename});
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
    Object? message = null,
    Object? filename = null,
  }) {
    return _then(_$PlantRecognitionResponseModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 13, adapterName: 'PlantRecognitionResponseModelAdapter')
class _$PlantRecognitionResponseModelImpl
    extends _PlantRecognitionResponseModel {
  _$PlantRecognitionResponseModelImpl(
      {@JsonKey(name: 'message') @HiveField(0) required this.message,
      @JsonKey(name: 'filename') @HiveField(1) required this.filename})
      : super._();

  factory _$PlantRecognitionResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlantRecognitionResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  @HiveField(0)
  final String message;
  @override
  @JsonKey(name: 'filename')
  @HiveField(1)
  final String filename;

  @override
  String toString() {
    return 'PlantRecognitionResponseModel(message: $message, filename: $filename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantRecognitionResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, filename);

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
      {@JsonKey(name: 'message') @HiveField(0) required final String message,
      @JsonKey(name: 'filename')
      @HiveField(1)
      required final String filename}) = _$PlantRecognitionResponseModelImpl;
  _PlantRecognitionResponseModel._() : super._();

  factory _PlantRecognitionResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlantRecognitionResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  @HiveField(0)
  String get message;
  @override
  @JsonKey(name: 'filename')
  @HiveField(1)
  String get filename;

  /// Create a copy of PlantRecognitionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantRecognitionResponseModelImplCopyWith<
          _$PlantRecognitionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
