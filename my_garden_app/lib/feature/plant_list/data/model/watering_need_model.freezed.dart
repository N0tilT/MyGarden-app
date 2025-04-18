// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watering_need_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WateringNeedModel _$WateringNeedModelFromJson(Map<String, dynamic> json) {
  return _WateringNeedModel.fromJson(json);
}

/// @nodoc
mixin _$WateringNeedModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this WateringNeedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WateringNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WateringNeedModelCopyWith<WateringNeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WateringNeedModelCopyWith<$Res> {
  factory $WateringNeedModelCopyWith(
          WateringNeedModel value, $Res Function(WateringNeedModel) then) =
      _$WateringNeedModelCopyWithImpl<$Res, WateringNeedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class _$WateringNeedModelCopyWithImpl<$Res, $Val extends WateringNeedModel>
    implements $WateringNeedModelCopyWith<$Res> {
  _$WateringNeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WateringNeedModel
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
abstract class _$$WateringNeedModelImplCopyWith<$Res>
    implements $WateringNeedModelCopyWith<$Res> {
  factory _$$WateringNeedModelImplCopyWith(_$WateringNeedModelImpl value,
          $Res Function(_$WateringNeedModelImpl) then) =
      __$$WateringNeedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class __$$WateringNeedModelImplCopyWithImpl<$Res>
    extends _$WateringNeedModelCopyWithImpl<$Res, _$WateringNeedModelImpl>
    implements _$$WateringNeedModelImplCopyWith<$Res> {
  __$$WateringNeedModelImplCopyWithImpl(_$WateringNeedModelImpl _value,
      $Res Function(_$WateringNeedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WateringNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
  }) {
    return _then(_$WateringNeedModelImpl(
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
@JsonSerializable()
@HiveType(typeId: 9, adapterName: 'WateringNeedModelAdapter')
class _$WateringNeedModelImpl extends _WateringNeedModel {
  _$WateringNeedModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title})
      : super._();

  factory _$WateringNeedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WateringNeedModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String? title;

  @override
  String toString() {
    return 'WateringNeedModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WateringNeedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of WateringNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WateringNeedModelImplCopyWith<_$WateringNeedModelImpl> get copyWith =>
      __$$WateringNeedModelImplCopyWithImpl<_$WateringNeedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WateringNeedModelImplToJson(
      this,
    );
  }
}

abstract class _WateringNeedModel extends WateringNeedModel {
  factory _WateringNeedModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title}) =
      _$WateringNeedModelImpl;
  _WateringNeedModel._() : super._();

  factory _WateringNeedModel.fromJson(Map<String, dynamic> json) =
      _$WateringNeedModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;

  /// Create a copy of WateringNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WateringNeedModelImplCopyWith<_$WateringNeedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
