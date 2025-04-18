// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_variety_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantVarietyModel _$PlantVarietyModelFromJson(Map<String, dynamic> json) {
  return _PlantVarietyModel.fromJson(json);
}

/// @nodoc
mixin _$PlantVarietyModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this PlantVarietyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantVarietyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantVarietyModelCopyWith<PlantVarietyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantVarietyModelCopyWith<$Res> {
  factory $PlantVarietyModelCopyWith(
          PlantVarietyModel value, $Res Function(PlantVarietyModel) then) =
      _$PlantVarietyModelCopyWithImpl<$Res, PlantVarietyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class _$PlantVarietyModelCopyWithImpl<$Res, $Val extends PlantVarietyModel>
    implements $PlantVarietyModelCopyWith<$Res> {
  _$PlantVarietyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantVarietyModel
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
abstract class _$$PlantVarietyModelImplCopyWith<$Res>
    implements $PlantVarietyModelCopyWith<$Res> {
  factory _$$PlantVarietyModelImplCopyWith(_$PlantVarietyModelImpl value,
          $Res Function(_$PlantVarietyModelImpl) then) =
      __$$PlantVarietyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class __$$PlantVarietyModelImplCopyWithImpl<$Res>
    extends _$PlantVarietyModelCopyWithImpl<$Res, _$PlantVarietyModelImpl>
    implements _$$PlantVarietyModelImplCopyWith<$Res> {
  __$$PlantVarietyModelImplCopyWithImpl(_$PlantVarietyModelImpl _value,
      $Res Function(_$PlantVarietyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantVarietyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
  }) {
    return _then(_$PlantVarietyModelImpl(
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
@HiveType(typeId: 11, adapterName: 'PlantVarietyModelAdapter')
class _$PlantVarietyModelImpl extends _PlantVarietyModel {
  _$PlantVarietyModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title})
      : super._();

  factory _$PlantVarietyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantVarietyModelImplFromJson(json);

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
    return 'PlantVarietyModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantVarietyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of PlantVarietyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantVarietyModelImplCopyWith<_$PlantVarietyModelImpl> get copyWith =>
      __$$PlantVarietyModelImplCopyWithImpl<_$PlantVarietyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantVarietyModelImplToJson(
      this,
    );
  }
}

abstract class _PlantVarietyModel extends PlantVarietyModel {
  factory _PlantVarietyModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title}) =
      _$PlantVarietyModelImpl;
  _PlantVarietyModel._() : super._();

  factory _PlantVarietyModel.fromJson(Map<String, dynamic> json) =
      _$PlantVarietyModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;

  /// Create a copy of PlantVarietyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantVarietyModelImplCopyWith<_$PlantVarietyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
