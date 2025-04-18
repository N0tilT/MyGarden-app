// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantRequestModel _$PlantRequestModelFromJson(Map<String, dynamic> json) {
  return _PlantRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PlantRequestModel {
  String get userId => throw _privateConstructorUsedError;
  List<int>? get ids => throw _privateConstructorUsedError;

  /// Serializes this PlantRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantRequestModelCopyWith<PlantRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantRequestModelCopyWith<$Res> {
  factory $PlantRequestModelCopyWith(
          PlantRequestModel value, $Res Function(PlantRequestModel) then) =
      _$PlantRequestModelCopyWithImpl<$Res, PlantRequestModel>;
  @useResult
  $Res call({String userId, List<int>? ids});
}

/// @nodoc
class _$PlantRequestModelCopyWithImpl<$Res, $Val extends PlantRequestModel>
    implements $PlantRequestModelCopyWith<$Res> {
  _$PlantRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantRequestModelImplCopyWith<$Res>
    implements $PlantRequestModelCopyWith<$Res> {
  factory _$$PlantRequestModelImplCopyWith(_$PlantRequestModelImpl value,
          $Res Function(_$PlantRequestModelImpl) then) =
      __$$PlantRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, List<int>? ids});
}

/// @nodoc
class __$$PlantRequestModelImplCopyWithImpl<$Res>
    extends _$PlantRequestModelCopyWithImpl<$Res, _$PlantRequestModelImpl>
    implements _$$PlantRequestModelImplCopyWith<$Res> {
  __$$PlantRequestModelImplCopyWithImpl(_$PlantRequestModelImpl _value,
      $Res Function(_$PlantRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? ids = freezed,
  }) {
    return _then(_$PlantRequestModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantRequestModelImpl implements _PlantRequestModel {
  const _$PlantRequestModelImpl(
      {required this.userId, required final List<int>? ids})
      : _ids = ids;

  factory _$PlantRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantRequestModelImplFromJson(json);

  @override
  final String userId;
  final List<int>? _ids;
  @override
  List<int>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlantRequestModel(userId: $userId, ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantRequestModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_ids));

  /// Create a copy of PlantRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantRequestModelImplCopyWith<_$PlantRequestModelImpl> get copyWith =>
      __$$PlantRequestModelImplCopyWithImpl<_$PlantRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PlantRequestModel implements PlantRequestModel {
  const factory _PlantRequestModel(
      {required final String userId,
      required final List<int>? ids}) = _$PlantRequestModelImpl;

  factory _PlantRequestModel.fromJson(Map<String, dynamic> json) =
      _$PlantRequestModelImpl.fromJson;

  @override
  String get userId;
  @override
  List<int>? get ids;

  /// Create a copy of PlantRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantRequestModelImplCopyWith<_$PlantRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
