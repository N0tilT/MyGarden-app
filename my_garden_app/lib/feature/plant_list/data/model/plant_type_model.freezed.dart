// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantTypeModel _$PlantTypeModelFromJson(Map<String, dynamic> json) {
  return _PlantTypeModel.fromJson(json);
}

/// @nodoc
mixin _$PlantTypeModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this PlantTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantTypeModelCopyWith<PlantTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantTypeModelCopyWith<$Res> {
  factory $PlantTypeModelCopyWith(
          PlantTypeModel value, $Res Function(PlantTypeModel) then) =
      _$PlantTypeModelCopyWithImpl<$Res, PlantTypeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class _$PlantTypeModelCopyWithImpl<$Res, $Val extends PlantTypeModel>
    implements $PlantTypeModelCopyWith<$Res> {
  _$PlantTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantTypeModel
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
abstract class _$$PlantTypeModelImplCopyWith<$Res>
    implements $PlantTypeModelCopyWith<$Res> {
  factory _$$PlantTypeModelImplCopyWith(_$PlantTypeModelImpl value,
          $Res Function(_$PlantTypeModelImpl) then) =
      __$$PlantTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class __$$PlantTypeModelImplCopyWithImpl<$Res>
    extends _$PlantTypeModelCopyWithImpl<$Res, _$PlantTypeModelImpl>
    implements _$$PlantTypeModelImplCopyWith<$Res> {
  __$$PlantTypeModelImplCopyWithImpl(
      _$PlantTypeModelImpl _value, $Res Function(_$PlantTypeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
  }) {
    return _then(_$PlantTypeModelImpl(
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
@HiveType(typeId: 10, adapterName: 'PlantTypeModelAdapter')
class _$PlantTypeModelImpl extends _PlantTypeModel {
  _$PlantTypeModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title})
      : super._();

  factory _$PlantTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantTypeModelImplFromJson(json);

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
    return 'PlantTypeModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantTypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of PlantTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantTypeModelImplCopyWith<_$PlantTypeModelImpl> get copyWith =>
      __$$PlantTypeModelImplCopyWithImpl<_$PlantTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantTypeModelImplToJson(
      this,
    );
  }
}

abstract class _PlantTypeModel extends PlantTypeModel {
  factory _PlantTypeModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title}) =
      _$PlantTypeModelImpl;
  _PlantTypeModel._() : super._();

  factory _PlantTypeModel.fromJson(Map<String, dynamic> json) =
      _$PlantTypeModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;

  /// Create a copy of PlantTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantTypeModelImplCopyWith<_$PlantTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
