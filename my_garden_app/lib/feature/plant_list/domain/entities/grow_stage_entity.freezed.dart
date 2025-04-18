// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grow_stage_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GrowStageEntity {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  /// Create a copy of GrowStageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrowStageEntityCopyWith<GrowStageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowStageEntityCopyWith<$Res> {
  factory $GrowStageEntityCopyWith(
          GrowStageEntity value, $Res Function(GrowStageEntity) then) =
      _$GrowStageEntityCopyWithImpl<$Res, GrowStageEntity>;
  @useResult
  $Res call({int id, String? title});
}

/// @nodoc
class _$GrowStageEntityCopyWithImpl<$Res, $Val extends GrowStageEntity>
    implements $GrowStageEntityCopyWith<$Res> {
  _$GrowStageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrowStageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrowStageEntityImplCopyWith<$Res>
    implements $GrowStageEntityCopyWith<$Res> {
  factory _$$GrowStageEntityImplCopyWith(_$GrowStageEntityImpl value,
          $Res Function(_$GrowStageEntityImpl) then) =
      __$$GrowStageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title});
}

/// @nodoc
class __$$GrowStageEntityImplCopyWithImpl<$Res>
    extends _$GrowStageEntityCopyWithImpl<$Res, _$GrowStageEntityImpl>
    implements _$$GrowStageEntityImplCopyWith<$Res> {
  __$$GrowStageEntityImplCopyWithImpl(
      _$GrowStageEntityImpl _value, $Res Function(_$GrowStageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrowStageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
  }) {
    return _then(_$GrowStageEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GrowStageEntityImpl extends _GrowStageEntity {
  const _$GrowStageEntityImpl({required this.id, required this.title})
      : super._();

  @override
  final int id;
  @override
  final String? title;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrowStageEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of GrowStageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrowStageEntityImplCopyWith<_$GrowStageEntityImpl> get copyWith =>
      __$$GrowStageEntityImplCopyWithImpl<_$GrowStageEntityImpl>(
          this, _$identity);
}

abstract class _GrowStageEntity extends GrowStageEntity {
  const factory _GrowStageEntity(
      {required final int id,
      required final String? title}) = _$GrowStageEntityImpl;
  const _GrowStageEntity._() : super._();

  @override
  int get id;
  @override
  String? get title;

  /// Create a copy of GrowStageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrowStageEntityImplCopyWith<_$GrowStageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
