// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_recognition_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlantRecognitionResponseEntity {
  String get name => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of PlantRecognitionResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantRecognitionResponseEntityCopyWith<PlantRecognitionResponseEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantRecognitionResponseEntityCopyWith<$Res> {
  factory $PlantRecognitionResponseEntityCopyWith(
          PlantRecognitionResponseEntity value,
          $Res Function(PlantRecognitionResponseEntity) then) =
      _$PlantRecognitionResponseEntityCopyWithImpl<$Res,
          PlantRecognitionResponseEntity>;
  @useResult
  $Res call({String name, String message});
}

/// @nodoc
class _$PlantRecognitionResponseEntityCopyWithImpl<$Res,
        $Val extends PlantRecognitionResponseEntity>
    implements $PlantRecognitionResponseEntityCopyWith<$Res> {
  _$PlantRecognitionResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantRecognitionResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantRecognitionResponseEntityImplCopyWith<$Res>
    implements $PlantRecognitionResponseEntityCopyWith<$Res> {
  factory _$$PlantRecognitionResponseEntityImplCopyWith(
          _$PlantRecognitionResponseEntityImpl value,
          $Res Function(_$PlantRecognitionResponseEntityImpl) then) =
      __$$PlantRecognitionResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String message});
}

/// @nodoc
class __$$PlantRecognitionResponseEntityImplCopyWithImpl<$Res>
    extends _$PlantRecognitionResponseEntityCopyWithImpl<$Res,
        _$PlantRecognitionResponseEntityImpl>
    implements _$$PlantRecognitionResponseEntityImplCopyWith<$Res> {
  __$$PlantRecognitionResponseEntityImplCopyWithImpl(
      _$PlantRecognitionResponseEntityImpl _value,
      $Res Function(_$PlantRecognitionResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantRecognitionResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_$PlantRecognitionResponseEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlantRecognitionResponseEntityImpl
    extends _PlantRecognitionResponseEntity {
  const _$PlantRecognitionResponseEntityImpl(
      {required this.name, required this.message})
      : super._();

  @override
  final String name;
  @override
  final String message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantRecognitionResponseEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, message);

  /// Create a copy of PlantRecognitionResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantRecognitionResponseEntityImplCopyWith<
          _$PlantRecognitionResponseEntityImpl>
      get copyWith => __$$PlantRecognitionResponseEntityImplCopyWithImpl<
          _$PlantRecognitionResponseEntityImpl>(this, _$identity);
}

abstract class _PlantRecognitionResponseEntity
    extends PlantRecognitionResponseEntity {
  const factory _PlantRecognitionResponseEntity(
      {required final String name,
      required final String message}) = _$PlantRecognitionResponseEntityImpl;
  const _PlantRecognitionResponseEntity._() : super._();

  @override
  String get name;
  @override
  String get message;

  /// Create a copy of PlantRecognitionResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantRecognitionResponseEntityImplCopyWith<
          _$PlantRecognitionResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
