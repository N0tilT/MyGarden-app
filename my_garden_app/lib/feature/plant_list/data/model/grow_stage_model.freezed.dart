// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grow_stage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GrowStageModel _$GrowStageModelFromJson(Map<String, dynamic> json) {
  return _GrowStageModel.fromJson(json);
}

/// @nodoc
mixin _$GrowStageModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this GrowStageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrowStageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrowStageModelCopyWith<GrowStageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowStageModelCopyWith<$Res> {
  factory $GrowStageModelCopyWith(
          GrowStageModel value, $Res Function(GrowStageModel) then) =
      _$GrowStageModelCopyWithImpl<$Res, GrowStageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class _$GrowStageModelCopyWithImpl<$Res, $Val extends GrowStageModel>
    implements $GrowStageModelCopyWith<$Res> {
  _$GrowStageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrowStageModel
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
abstract class _$$GrowStageModelImplCopyWith<$Res>
    implements $GrowStageModelCopyWith<$Res> {
  factory _$$GrowStageModelImplCopyWith(_$GrowStageModelImpl value,
          $Res Function(_$GrowStageModelImpl) then) =
      __$$GrowStageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title});
}

/// @nodoc
class __$$GrowStageModelImplCopyWithImpl<$Res>
    extends _$GrowStageModelCopyWithImpl<$Res, _$GrowStageModelImpl>
    implements _$$GrowStageModelImplCopyWith<$Res> {
  __$$GrowStageModelImplCopyWithImpl(
      _$GrowStageModelImpl _value, $Res Function(_$GrowStageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrowStageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
  }) {
    return _then(_$GrowStageModelImpl(
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
@HiveType(typeId: 7, adapterName: 'GrowStageModelAdapter')
class _$GrowStageModelImpl extends _GrowStageModel {
  _$GrowStageModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title})
      : super._();

  factory _$GrowStageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrowStageModelImplFromJson(json);

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
    return 'GrowStageModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrowStageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of GrowStageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrowStageModelImplCopyWith<_$GrowStageModelImpl> get copyWith =>
      __$$GrowStageModelImplCopyWithImpl<_$GrowStageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrowStageModelImplToJson(
      this,
    );
  }
}

abstract class _GrowStageModel extends GrowStageModel {
  factory _GrowStageModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title}) =
      _$GrowStageModelImpl;
  _GrowStageModel._() : super._();

  factory _GrowStageModel.fromJson(Map<String, dynamic> json) =
      _$GrowStageModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;

  /// Create a copy of GrowStageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrowStageModelImplCopyWith<_$GrowStageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
