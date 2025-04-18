// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'light_need_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LightNeedModel _$LightNeedModelFromJson(Map<String, dynamic> json) {
  return _LightNeedModel.fromJson(json);
}

/// @nodoc
mixin _$LightNeedModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this LightNeedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightNeedModelCopyWith<LightNeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightNeedModelCopyWith<$Res> {
  factory $LightNeedModelCopyWith(
          LightNeedModel value, $Res Function(LightNeedModel) then) =
      _$LightNeedModelCopyWithImpl<$Res, LightNeedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class _$LightNeedModelCopyWithImpl<$Res, $Val extends LightNeedModel>
    implements $LightNeedModelCopyWith<$Res> {
  _$LightNeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightNeedModel
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
abstract class _$$LightNeedModelImplCopyWith<$Res>
    implements $LightNeedModelCopyWith<$Res> {
  factory _$$LightNeedModelImplCopyWith(_$LightNeedModelImpl value,
          $Res Function(_$LightNeedModelImpl) then) =
      __$$LightNeedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class __$$LightNeedModelImplCopyWithImpl<$Res>
    extends _$LightNeedModelCopyWithImpl<$Res, _$LightNeedModelImpl>
    implements _$$LightNeedModelImplCopyWith<$Res> {
  __$$LightNeedModelImplCopyWithImpl(
      _$LightNeedModelImpl _value, $Res Function(_$LightNeedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
  }) {
    return _then(_$LightNeedModelImpl(
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
@HiveType(typeId: 8, adapterName: 'LightNeedModelAdapter')
class _$LightNeedModelImpl extends _LightNeedModel {
  _$LightNeedModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title})
      : super._();

  factory _$LightNeedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightNeedModelImplFromJson(json);

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
    return 'LightNeedModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightNeedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of LightNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightNeedModelImplCopyWith<_$LightNeedModelImpl> get copyWith =>
      __$$LightNeedModelImplCopyWithImpl<_$LightNeedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightNeedModelImplToJson(
      this,
    );
  }
}

abstract class _LightNeedModel extends LightNeedModel {
  factory _LightNeedModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title}) =
      _$LightNeedModelImpl;
  _LightNeedModel._() : super._();

  factory _LightNeedModel.fromJson(Map<String, dynamic> json) =
      _$LightNeedModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;

  /// Create a copy of LightNeedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightNeedModelImplCopyWith<_$LightNeedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
