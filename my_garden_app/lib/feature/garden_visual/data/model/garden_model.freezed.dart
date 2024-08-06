// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garden_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GardenModel _$GardenModelFromJson(Map<String, dynamic> json) {
  return _GardenModel.fromJson(json);
}

/// @nodoc
mixin _$GardenModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GardenModelCopyWith<GardenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GardenModelCopyWith<$Res> {
  factory $GardenModelCopyWith(
          GardenModel value, $Res Function(GardenModel) then) =
      _$GardenModelCopyWithImpl<$Res, GardenModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String title});
}

/// @nodoc
class _$GardenModelCopyWithImpl<$Res, $Val extends GardenModel>
    implements $GardenModelCopyWith<$Res> {
  _$GardenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GardenModelImplCopyWith<$Res>
    implements $GardenModelCopyWith<$Res> {
  factory _$$GardenModelImplCopyWith(
          _$GardenModelImpl value, $Res Function(_$GardenModelImpl) then) =
      __$$GardenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String title});
}

/// @nodoc
class __$$GardenModelImplCopyWithImpl<$Res>
    extends _$GardenModelCopyWithImpl<$Res, _$GardenModelImpl>
    implements _$$GardenModelImplCopyWith<$Res> {
  __$$GardenModelImplCopyWithImpl(
      _$GardenModelImpl _value, $Res Function(_$GardenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$GardenModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4, adapterName: 'GardenModelAdapter')
class _$GardenModelImpl extends _GardenModel {
  _$GardenModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title})
      : super._();

  factory _$GardenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GardenModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String title;

  @override
  String toString() {
    return 'GardenModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GardenModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GardenModelImplCopyWith<_$GardenModelImpl> get copyWith =>
      __$$GardenModelImplCopyWithImpl<_$GardenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GardenModelImplToJson(
      this,
    );
  }
}

abstract class _GardenModel extends GardenModel {
  factory _GardenModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int id,
          @JsonKey(name: 'title') @HiveField(1) required final String title}) =
      _$GardenModelImpl;
  _GardenModel._() : super._();

  factory _GardenModel.fromJson(Map<String, dynamic> json) =
      _$GardenModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$GardenModelImplCopyWith<_$GardenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
