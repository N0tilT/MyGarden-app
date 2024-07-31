// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flower_bed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlowerBedModel _$FlowerBedModelFromJson(Map<String, dynamic> json) {
  return _FlowerBedModel.fromJson(json);
}

/// @nodoc
mixin _$FlowerBedModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  @HiveField(1)
  int get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  @HiveField(2)
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'trueDx')
  @HiveField(3)
  double get trueDx => throw _privateConstructorUsedError;
  @JsonKey(name: 'trueDy')
  @HiveField(4)
  double get trueDy => throw _privateConstructorUsedError;
  @JsonKey(name: 'dx')
  @HiveField(5)
  double get dx => throw _privateConstructorUsedError;
  @JsonKey(name: 'dy')
  @HiveField(6)
  double get dy => throw _privateConstructorUsedError;
  @JsonKey(name: 'rotation')
  @HiveField(7)
  double get rotation => throw _privateConstructorUsedError;
  @JsonKey(name: 'plantIds')
  @HiveField(8)
  List<int> get plantIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlowerBedModelCopyWith<FlowerBedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlowerBedModelCopyWith<$Res> {
  factory $FlowerBedModelCopyWith(
          FlowerBedModel value, $Res Function(FlowerBedModel) then) =
      _$FlowerBedModelCopyWithImpl<$Res, FlowerBedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'width') @HiveField(1) int width,
      @JsonKey(name: 'height') @HiveField(2) int height,
      @JsonKey(name: 'trueDx') @HiveField(3) double trueDx,
      @JsonKey(name: 'trueDy') @HiveField(4) double trueDy,
      @JsonKey(name: 'dx') @HiveField(5) double dx,
      @JsonKey(name: 'dy') @HiveField(6) double dy,
      @JsonKey(name: 'rotation') @HiveField(7) double rotation,
      @JsonKey(name: 'plantIds') @HiveField(8) List<int> plantIds});
}

/// @nodoc
class _$FlowerBedModelCopyWithImpl<$Res, $Val extends FlowerBedModel>
    implements $FlowerBedModelCopyWith<$Res> {
  _$FlowerBedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
    Object? trueDx = null,
    Object? trueDy = null,
    Object? dx = null,
    Object? dy = null,
    Object? rotation = null,
    Object? plantIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      trueDx: null == trueDx
          ? _value.trueDx
          : trueDx // ignore: cast_nullable_to_non_nullable
              as double,
      trueDy: null == trueDy
          ? _value.trueDy
          : trueDy // ignore: cast_nullable_to_non_nullable
              as double,
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
      plantIds: null == plantIds
          ? _value.plantIds
          : plantIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlowerBedModelImplCopyWith<$Res>
    implements $FlowerBedModelCopyWith<$Res> {
  factory _$$FlowerBedModelImplCopyWith(_$FlowerBedModelImpl value,
          $Res Function(_$FlowerBedModelImpl) then) =
      __$$FlowerBedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'width') @HiveField(1) int width,
      @JsonKey(name: 'height') @HiveField(2) int height,
      @JsonKey(name: 'trueDx') @HiveField(3) double trueDx,
      @JsonKey(name: 'trueDy') @HiveField(4) double trueDy,
      @JsonKey(name: 'dx') @HiveField(5) double dx,
      @JsonKey(name: 'dy') @HiveField(6) double dy,
      @JsonKey(name: 'rotation') @HiveField(7) double rotation,
      @JsonKey(name: 'plantIds') @HiveField(8) List<int> plantIds});
}

/// @nodoc
class __$$FlowerBedModelImplCopyWithImpl<$Res>
    extends _$FlowerBedModelCopyWithImpl<$Res, _$FlowerBedModelImpl>
    implements _$$FlowerBedModelImplCopyWith<$Res> {
  __$$FlowerBedModelImplCopyWithImpl(
      _$FlowerBedModelImpl _value, $Res Function(_$FlowerBedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
    Object? trueDx = null,
    Object? trueDy = null,
    Object? dx = null,
    Object? dy = null,
    Object? rotation = null,
    Object? plantIds = null,
  }) {
    return _then(_$FlowerBedModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      trueDx: null == trueDx
          ? _value.trueDx
          : trueDx // ignore: cast_nullable_to_non_nullable
              as double,
      trueDy: null == trueDy
          ? _value.trueDy
          : trueDy // ignore: cast_nullable_to_non_nullable
              as double,
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
      plantIds: null == plantIds
          ? _value._plantIds
          : plantIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'FlowerBedModelAdapter')
class _$FlowerBedModelImpl extends _FlowerBedModel {
  _$FlowerBedModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'width') @HiveField(1) required this.width,
      @JsonKey(name: 'height') @HiveField(2) required this.height,
      @JsonKey(name: 'trueDx') @HiveField(3) required this.trueDx,
      @JsonKey(name: 'trueDy') @HiveField(4) required this.trueDy,
      @JsonKey(name: 'dx') @HiveField(5) required this.dx,
      @JsonKey(name: 'dy') @HiveField(6) required this.dy,
      @JsonKey(name: 'rotation') @HiveField(7) required this.rotation,
      @JsonKey(name: 'plantIds')
      @HiveField(8)
      required final List<int> plantIds})
      : _plantIds = plantIds,
        super._();

  factory _$FlowerBedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlowerBedModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'width')
  @HiveField(1)
  final int width;
  @override
  @JsonKey(name: 'height')
  @HiveField(2)
  final int height;
  @override
  @JsonKey(name: 'trueDx')
  @HiveField(3)
  final double trueDx;
  @override
  @JsonKey(name: 'trueDy')
  @HiveField(4)
  final double trueDy;
  @override
  @JsonKey(name: 'dx')
  @HiveField(5)
  final double dx;
  @override
  @JsonKey(name: 'dy')
  @HiveField(6)
  final double dy;
  @override
  @JsonKey(name: 'rotation')
  @HiveField(7)
  final double rotation;
  final List<int> _plantIds;
  @override
  @JsonKey(name: 'plantIds')
  @HiveField(8)
  List<int> get plantIds {
    if (_plantIds is EqualUnmodifiableListView) return _plantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plantIds);
  }

  @override
  String toString() {
    return 'FlowerBedModel(id: $id, width: $width, height: $height, trueDx: $trueDx, trueDy: $trueDy, dx: $dx, dy: $dy, rotation: $rotation, plantIds: $plantIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlowerBedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.trueDx, trueDx) || other.trueDx == trueDx) &&
            (identical(other.trueDy, trueDy) || other.trueDy == trueDy) &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            const DeepCollectionEquality().equals(other._plantIds, _plantIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, width, height, trueDx,
      trueDy, dx, dy, rotation, const DeepCollectionEquality().hash(_plantIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlowerBedModelImplCopyWith<_$FlowerBedModelImpl> get copyWith =>
      __$$FlowerBedModelImplCopyWithImpl<_$FlowerBedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlowerBedModelImplToJson(
      this,
    );
  }
}

abstract class _FlowerBedModel extends FlowerBedModel {
  factory _FlowerBedModel(
      {@JsonKey(name: 'id') @HiveField(0) required final int id,
      @JsonKey(name: 'width') @HiveField(1) required final int width,
      @JsonKey(name: 'height') @HiveField(2) required final int height,
      @JsonKey(name: 'trueDx') @HiveField(3) required final double trueDx,
      @JsonKey(name: 'trueDy') @HiveField(4) required final double trueDy,
      @JsonKey(name: 'dx') @HiveField(5) required final double dx,
      @JsonKey(name: 'dy') @HiveField(6) required final double dy,
      @JsonKey(name: 'rotation') @HiveField(7) required final double rotation,
      @JsonKey(name: 'plantIds')
      @HiveField(8)
      required final List<int> plantIds}) = _$FlowerBedModelImpl;
  _FlowerBedModel._() : super._();

  factory _FlowerBedModel.fromJson(Map<String, dynamic> json) =
      _$FlowerBedModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'width')
  @HiveField(1)
  int get width;
  @override
  @JsonKey(name: 'height')
  @HiveField(2)
  int get height;
  @override
  @JsonKey(name: 'trueDx')
  @HiveField(3)
  double get trueDx;
  @override
  @JsonKey(name: 'trueDy')
  @HiveField(4)
  double get trueDy;
  @override
  @JsonKey(name: 'dx')
  @HiveField(5)
  double get dx;
  @override
  @JsonKey(name: 'dy')
  @HiveField(6)
  double get dy;
  @override
  @JsonKey(name: 'rotation')
  @HiveField(7)
  double get rotation;
  @override
  @JsonKey(name: 'plantIds')
  @HiveField(8)
  List<int> get plantIds;
  @override
  @JsonKey(ignore: true)
  _$$FlowerBedModelImplCopyWith<_$FlowerBedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}