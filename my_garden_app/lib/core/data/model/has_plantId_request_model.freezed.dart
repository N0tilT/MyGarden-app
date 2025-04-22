// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'has_plantId_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HasPlantidRequestModel _$HasPlantidRequestModelFromJson(
    Map<String, dynamic> json) {
  return _HasPlantidRequestModel.fromJson(json);
}

/// @nodoc
mixin _$HasPlantidRequestModel {
  String? get userId => throw _privateConstructorUsedError;
  List<int>? get ids => throw _privateConstructorUsedError;
  List<int>? get plantIds => throw _privateConstructorUsedError;

  /// Serializes this HasPlantidRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HasPlantidRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HasPlantidRequestModelCopyWith<HasPlantidRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HasPlantidRequestModelCopyWith<$Res> {
  factory $HasPlantidRequestModelCopyWith(HasPlantidRequestModel value,
          $Res Function(HasPlantidRequestModel) then) =
      _$HasPlantidRequestModelCopyWithImpl<$Res, HasPlantidRequestModel>;
  @useResult
  $Res call({String? userId, List<int>? ids, List<int>? plantIds});
}

/// @nodoc
class _$HasPlantidRequestModelCopyWithImpl<$Res,
        $Val extends HasPlantidRequestModel>
    implements $HasPlantidRequestModelCopyWith<$Res> {
  _$HasPlantidRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HasPlantidRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? ids = freezed,
    Object? plantIds = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      plantIds: freezed == plantIds
          ? _value.plantIds
          : plantIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HasPlantidRequestModelImplCopyWith<$Res>
    implements $HasPlantidRequestModelCopyWith<$Res> {
  factory _$$HasPlantidRequestModelImplCopyWith(
          _$HasPlantidRequestModelImpl value,
          $Res Function(_$HasPlantidRequestModelImpl) then) =
      __$$HasPlantidRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, List<int>? ids, List<int>? plantIds});
}

/// @nodoc
class __$$HasPlantidRequestModelImplCopyWithImpl<$Res>
    extends _$HasPlantidRequestModelCopyWithImpl<$Res,
        _$HasPlantidRequestModelImpl>
    implements _$$HasPlantidRequestModelImplCopyWith<$Res> {
  __$$HasPlantidRequestModelImplCopyWithImpl(
      _$HasPlantidRequestModelImpl _value,
      $Res Function(_$HasPlantidRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HasPlantidRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? ids = freezed,
    Object? plantIds = freezed,
  }) {
    return _then(_$HasPlantidRequestModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      plantIds: freezed == plantIds
          ? _value._plantIds
          : plantIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HasPlantidRequestModelImpl implements _HasPlantidRequestModel {
  const _$HasPlantidRequestModelImpl(
      {required this.userId,
      required final List<int>? ids,
      required final List<int>? plantIds})
      : _ids = ids,
        _plantIds = plantIds;

  factory _$HasPlantidRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HasPlantidRequestModelImplFromJson(json);

  @override
  final String? userId;
  final List<int>? _ids;
  @override
  List<int>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _plantIds;
  @override
  List<int>? get plantIds {
    final value = _plantIds;
    if (value == null) return null;
    if (_plantIds is EqualUnmodifiableListView) return _plantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HasPlantidRequestModel(userId: $userId, ids: $ids, plantIds: $plantIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HasPlantidRequestModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality().equals(other._plantIds, _plantIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_ids),
      const DeepCollectionEquality().hash(_plantIds));

  /// Create a copy of HasPlantidRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HasPlantidRequestModelImplCopyWith<_$HasPlantidRequestModelImpl>
      get copyWith => __$$HasPlantidRequestModelImplCopyWithImpl<
          _$HasPlantidRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HasPlantidRequestModelImplToJson(
      this,
    );
  }
}

abstract class _HasPlantidRequestModel implements HasPlantidRequestModel {
  const factory _HasPlantidRequestModel(
      {required final String? userId,
      required final List<int>? ids,
      required final List<int>? plantIds}) = _$HasPlantidRequestModelImpl;

  factory _HasPlantidRequestModel.fromJson(Map<String, dynamic> json) =
      _$HasPlantidRequestModelImpl.fromJson;

  @override
  String? get userId;
  @override
  List<int>? get ids;
  @override
  List<int>? get plantIds;

  /// Create a copy of HasPlantidRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HasPlantidRequestModelImplCopyWith<_$HasPlantidRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
