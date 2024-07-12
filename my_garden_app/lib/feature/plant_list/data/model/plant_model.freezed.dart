// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantModel _$PlantModelFromJson(Map<String, dynamic> json) {
  return _PlantModel.fromJson(json);
}

/// @nodoc
mixin _$PlantModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'biologyTitle')
  @HiveField(2)
  String? get biologyTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'fertilization')
  @HiveField(3)
  String? get fertilization => throw _privateConstructorUsedError;
  @JsonKey(name: 'toxicity')
  @HiveField(4)
  String? get toxicity => throw _privateConstructorUsedError;
  @JsonKey(name: 'replacing')
  @HiveField(5)
  String? get replacing => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  @HiveField(6)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupId')
  @HiveField(7)
  int get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'wateringNeedId')
  @HiveField(8)
  int get wateringNeedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lightNeedId')
  @HiveField(9)
  int get lightNeedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stageId')
  @HiveField(10)
  int get stageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageId')
  @HiveField(11)
  int get imageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ripeningPeriod')
  @HiveField(12)
  int get ripeningPeriod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantModelCopyWith<PlantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantModelCopyWith<$Res> {
  factory $PlantModelCopyWith(
          PlantModel value, $Res Function(PlantModel) then) =
      _$PlantModelCopyWithImpl<$Res, PlantModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title,
      @JsonKey(name: 'biologyTitle') @HiveField(2) String? biologyTitle,
      @JsonKey(name: 'fertilization') @HiveField(3) String? fertilization,
      @JsonKey(name: 'toxicity') @HiveField(4) String? toxicity,
      @JsonKey(name: 'replacing') @HiveField(5) String? replacing,
      @JsonKey(name: 'description') @HiveField(6) String? description,
      @JsonKey(name: 'groupId') @HiveField(7) int groupId,
      @JsonKey(name: 'wateringNeedId') @HiveField(8) int wateringNeedId,
      @JsonKey(name: 'lightNeedId') @HiveField(9) int lightNeedId,
      @JsonKey(name: 'stageId') @HiveField(10) int stageId,
      @JsonKey(name: 'imageId') @HiveField(11) int imageId,
      @JsonKey(name: 'ripeningPeriod') @HiveField(12) int ripeningPeriod});
}

/// @nodoc
class _$PlantModelCopyWithImpl<$Res, $Val extends PlantModel>
    implements $PlantModelCopyWith<$Res> {
  _$PlantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? biologyTitle = freezed,
    Object? fertilization = freezed,
    Object? toxicity = freezed,
    Object? replacing = freezed,
    Object? description = freezed,
    Object? groupId = null,
    Object? wateringNeedId = null,
    Object? lightNeedId = null,
    Object? stageId = null,
    Object? imageId = null,
    Object? ripeningPeriod = null,
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
      biologyTitle: freezed == biologyTitle
          ? _value.biologyTitle
          : biologyTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      fertilization: freezed == fertilization
          ? _value.fertilization
          : fertilization // ignore: cast_nullable_to_non_nullable
              as String?,
      toxicity: freezed == toxicity
          ? _value.toxicity
          : toxicity // ignore: cast_nullable_to_non_nullable
              as String?,
      replacing: freezed == replacing
          ? _value.replacing
          : replacing // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      wateringNeedId: null == wateringNeedId
          ? _value.wateringNeedId
          : wateringNeedId // ignore: cast_nullable_to_non_nullable
              as int,
      lightNeedId: null == lightNeedId
          ? _value.lightNeedId
          : lightNeedId // ignore: cast_nullable_to_non_nullable
              as int,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as int,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      ripeningPeriod: null == ripeningPeriod
          ? _value.ripeningPeriod
          : ripeningPeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantModelImplCopyWith<$Res>
    implements $PlantModelCopyWith<$Res> {
  factory _$$PlantModelImplCopyWith(
          _$PlantModelImpl value, $Res Function(_$PlantModelImpl) then) =
      __$$PlantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'title') @HiveField(1) String? title,
      @JsonKey(name: 'biologyTitle') @HiveField(2) String? biologyTitle,
      @JsonKey(name: 'fertilization') @HiveField(3) String? fertilization,
      @JsonKey(name: 'toxicity') @HiveField(4) String? toxicity,
      @JsonKey(name: 'replacing') @HiveField(5) String? replacing,
      @JsonKey(name: 'description') @HiveField(6) String? description,
      @JsonKey(name: 'groupId') @HiveField(7) int groupId,
      @JsonKey(name: 'wateringNeedId') @HiveField(8) int wateringNeedId,
      @JsonKey(name: 'lightNeedId') @HiveField(9) int lightNeedId,
      @JsonKey(name: 'stageId') @HiveField(10) int stageId,
      @JsonKey(name: 'imageId') @HiveField(11) int imageId,
      @JsonKey(name: 'ripeningPeriod') @HiveField(12) int ripeningPeriod});
}

/// @nodoc
class __$$PlantModelImplCopyWithImpl<$Res>
    extends _$PlantModelCopyWithImpl<$Res, _$PlantModelImpl>
    implements _$$PlantModelImplCopyWith<$Res> {
  __$$PlantModelImplCopyWithImpl(
      _$PlantModelImpl _value, $Res Function(_$PlantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? biologyTitle = freezed,
    Object? fertilization = freezed,
    Object? toxicity = freezed,
    Object? replacing = freezed,
    Object? description = freezed,
    Object? groupId = null,
    Object? wateringNeedId = null,
    Object? lightNeedId = null,
    Object? stageId = null,
    Object? imageId = null,
    Object? ripeningPeriod = null,
  }) {
    return _then(_$PlantModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      biologyTitle: freezed == biologyTitle
          ? _value.biologyTitle
          : biologyTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      fertilization: freezed == fertilization
          ? _value.fertilization
          : fertilization // ignore: cast_nullable_to_non_nullable
              as String?,
      toxicity: freezed == toxicity
          ? _value.toxicity
          : toxicity // ignore: cast_nullable_to_non_nullable
              as String?,
      replacing: freezed == replacing
          ? _value.replacing
          : replacing // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      wateringNeedId: null == wateringNeedId
          ? _value.wateringNeedId
          : wateringNeedId // ignore: cast_nullable_to_non_nullable
              as int,
      lightNeedId: null == lightNeedId
          ? _value.lightNeedId
          : lightNeedId // ignore: cast_nullable_to_non_nullable
              as int,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as int,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      ripeningPeriod: null == ripeningPeriod
          ? _value.ripeningPeriod
          : ripeningPeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'CourseModelAdapter')
class _$PlantModelImpl extends _PlantModel {
  _$PlantModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title,
      @JsonKey(name: 'biologyTitle') @HiveField(2) required this.biologyTitle,
      @JsonKey(name: 'fertilization') @HiveField(3) required this.fertilization,
      @JsonKey(name: 'toxicity') @HiveField(4) required this.toxicity,
      @JsonKey(name: 'replacing') @HiveField(5) required this.replacing,
      @JsonKey(name: 'description') @HiveField(6) required this.description,
      @JsonKey(name: 'groupId') @HiveField(7) required this.groupId,
      @JsonKey(name: 'wateringNeedId')
      @HiveField(8)
      required this.wateringNeedId,
      @JsonKey(name: 'lightNeedId') @HiveField(9) required this.lightNeedId,
      @JsonKey(name: 'stageId') @HiveField(10) required this.stageId,
      @JsonKey(name: 'imageId') @HiveField(11) required this.imageId,
      @JsonKey(name: 'ripeningPeriod')
      @HiveField(12)
      required this.ripeningPeriod})
      : super._();

  factory _$PlantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String? title;
  @override
  @JsonKey(name: 'biologyTitle')
  @HiveField(2)
  final String? biologyTitle;
  @override
  @JsonKey(name: 'fertilization')
  @HiveField(3)
  final String? fertilization;
  @override
  @JsonKey(name: 'toxicity')
  @HiveField(4)
  final String? toxicity;
  @override
  @JsonKey(name: 'replacing')
  @HiveField(5)
  final String? replacing;
  @override
  @JsonKey(name: 'description')
  @HiveField(6)
  final String? description;
  @override
  @JsonKey(name: 'groupId')
  @HiveField(7)
  final int groupId;
  @override
  @JsonKey(name: 'wateringNeedId')
  @HiveField(8)
  final int wateringNeedId;
  @override
  @JsonKey(name: 'lightNeedId')
  @HiveField(9)
  final int lightNeedId;
  @override
  @JsonKey(name: 'stageId')
  @HiveField(10)
  final int stageId;
  @override
  @JsonKey(name: 'imageId')
  @HiveField(11)
  final int imageId;
  @override
  @JsonKey(name: 'ripeningPeriod')
  @HiveField(12)
  final int ripeningPeriod;

  @override
  String toString() {
    return 'PlantModel(id: $id, title: $title, biologyTitle: $biologyTitle, fertilization: $fertilization, toxicity: $toxicity, replacing: $replacing, description: $description, groupId: $groupId, wateringNeedId: $wateringNeedId, lightNeedId: $lightNeedId, stageId: $stageId, imageId: $imageId, ripeningPeriod: $ripeningPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.biologyTitle, biologyTitle) ||
                other.biologyTitle == biologyTitle) &&
            (identical(other.fertilization, fertilization) ||
                other.fertilization == fertilization) &&
            (identical(other.toxicity, toxicity) ||
                other.toxicity == toxicity) &&
            (identical(other.replacing, replacing) ||
                other.replacing == replacing) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.wateringNeedId, wateringNeedId) ||
                other.wateringNeedId == wateringNeedId) &&
            (identical(other.lightNeedId, lightNeedId) ||
                other.lightNeedId == lightNeedId) &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.ripeningPeriod, ripeningPeriod) ||
                other.ripeningPeriod == ripeningPeriod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      biologyTitle,
      fertilization,
      toxicity,
      replacing,
      description,
      groupId,
      wateringNeedId,
      lightNeedId,
      stageId,
      imageId,
      ripeningPeriod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantModelImplCopyWith<_$PlantModelImpl> get copyWith =>
      __$$PlantModelImplCopyWithImpl<_$PlantModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantModelImplToJson(
      this,
    );
  }
}

abstract class _PlantModel extends PlantModel {
  factory _PlantModel(
      {@JsonKey(name: 'id') @HiveField(0) required final int id,
      @JsonKey(name: 'title') @HiveField(1) required final String? title,
      @JsonKey(name: 'biologyTitle')
      @HiveField(2)
      required final String? biologyTitle,
      @JsonKey(name: 'fertilization')
      @HiveField(3)
      required final String? fertilization,
      @JsonKey(name: 'toxicity') @HiveField(4) required final String? toxicity,
      @JsonKey(name: 'replacing')
      @HiveField(5)
      required final String? replacing,
      @JsonKey(name: 'description')
      @HiveField(6)
      required final String? description,
      @JsonKey(name: 'groupId') @HiveField(7) required final int groupId,
      @JsonKey(name: 'wateringNeedId')
      @HiveField(8)
      required final int wateringNeedId,
      @JsonKey(name: 'lightNeedId')
      @HiveField(9)
      required final int lightNeedId,
      @JsonKey(name: 'stageId') @HiveField(10) required final int stageId,
      @JsonKey(name: 'imageId') @HiveField(11) required final int imageId,
      @JsonKey(name: 'ripeningPeriod')
      @HiveField(12)
      required final int ripeningPeriod}) = _$PlantModelImpl;
  _PlantModel._() : super._();

  factory _PlantModel.fromJson(Map<String, dynamic> json) =
      _$PlantModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;
  @override
  @JsonKey(name: 'biologyTitle')
  @HiveField(2)
  String? get biologyTitle;
  @override
  @JsonKey(name: 'fertilization')
  @HiveField(3)
  String? get fertilization;
  @override
  @JsonKey(name: 'toxicity')
  @HiveField(4)
  String? get toxicity;
  @override
  @JsonKey(name: 'replacing')
  @HiveField(5)
  String? get replacing;
  @override
  @JsonKey(name: 'description')
  @HiveField(6)
  String? get description;
  @override
  @JsonKey(name: 'groupId')
  @HiveField(7)
  int get groupId;
  @override
  @JsonKey(name: 'wateringNeedId')
  @HiveField(8)
  int get wateringNeedId;
  @override
  @JsonKey(name: 'lightNeedId')
  @HiveField(9)
  int get lightNeedId;
  @override
  @JsonKey(name: 'stageId')
  @HiveField(10)
  int get stageId;
  @override
  @JsonKey(name: 'imageId')
  @HiveField(11)
  int get imageId;
  @override
  @JsonKey(name: 'ripeningPeriod')
  @HiveField(12)
  int get ripeningPeriod;
  @override
  @JsonKey(ignore: true)
  _$$PlantModelImplCopyWith<_$PlantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
