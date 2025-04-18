// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garden_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GardenRequestModel _$GardenRequestModelFromJson(Map<String, dynamic> json) {
  return _GardenRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GardenRequestModel {
  String? get userId => throw _privateConstructorUsedError;
  List<int>? get ids => throw _privateConstructorUsedError;

  /// Serializes this GardenRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GardenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GardenRequestModelCopyWith<GardenRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GardenRequestModelCopyWith<$Res> {
  factory $GardenRequestModelCopyWith(
          GardenRequestModel value, $Res Function(GardenRequestModel) then) =
      _$GardenRequestModelCopyWithImpl<$Res, GardenRequestModel>;
  @useResult
  $Res call({String? userId, List<int>? ids});
}

/// @nodoc
class _$GardenRequestModelCopyWithImpl<$Res, $Val extends GardenRequestModel>
    implements $GardenRequestModelCopyWith<$Res> {
  _$GardenRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GardenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? ids = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GardenRequestModelImplCopyWith<$Res>
    implements $GardenRequestModelCopyWith<$Res> {
  factory _$$GardenRequestModelImplCopyWith(_$GardenRequestModelImpl value,
          $Res Function(_$GardenRequestModelImpl) then) =
      __$$GardenRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, List<int>? ids});
}

/// @nodoc
class __$$GardenRequestModelImplCopyWithImpl<$Res>
    extends _$GardenRequestModelCopyWithImpl<$Res, _$GardenRequestModelImpl>
    implements _$$GardenRequestModelImplCopyWith<$Res> {
  __$$GardenRequestModelImplCopyWithImpl(_$GardenRequestModelImpl _value,
      $Res Function(_$GardenRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GardenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? ids = freezed,
  }) {
    return _then(_$GardenRequestModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GardenRequestModelImpl implements _GardenRequestModel {
  const _$GardenRequestModelImpl(
      {required this.userId, required final List<int>? ids})
      : _ids = ids;

  factory _$GardenRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GardenRequestModelImplFromJson(json);

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

  @override
  String toString() {
    return 'GardenRequestModel(userId: $userId, ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GardenRequestModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_ids));

  /// Create a copy of GardenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GardenRequestModelImplCopyWith<_$GardenRequestModelImpl> get copyWith =>
      __$$GardenRequestModelImplCopyWithImpl<_$GardenRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GardenRequestModelImplToJson(
      this,
    );
  }
}

abstract class _GardenRequestModel implements GardenRequestModel {
  const factory _GardenRequestModel(
      {required final String? userId,
      required final List<int>? ids}) = _$GardenRequestModelImpl;

  factory _GardenRequestModel.fromJson(Map<String, dynamic> json) =
      _$GardenRequestModelImpl.fromJson;

  @override
  String? get userId;
  @override
  List<int>? get ids;

  /// Create a copy of GardenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GardenRequestModelImplCopyWith<_$GardenRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
