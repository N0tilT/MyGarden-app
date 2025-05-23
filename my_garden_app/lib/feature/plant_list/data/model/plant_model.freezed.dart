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
  int? get id => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'userId')
  @HiveField(13)
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'plantTypeId')
  @HiveField(14)
  int get plantTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'plantVarietyId')
  @HiveField(15)
  int get plantVarietyId => throw _privateConstructorUsedError;

  /// Serializes this PlantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'PlantModelAdapter')
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
      required this.ripeningPeriod,
      @JsonKey(name: 'userId') @HiveField(13) required this.userId,
      @JsonKey(name: 'plantTypeId') @HiveField(14) required this.plantTypeId,
      @JsonKey(name: 'plantVarietyId')
      @HiveField(15)
      required this.plantVarietyId})
      : super._();

  factory _$PlantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
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
  @JsonKey(name: 'userId')
  @HiveField(13)
  final String userId;
  @override
  @JsonKey(name: 'plantTypeId')
  @HiveField(14)
  final int plantTypeId;
  @override
  @JsonKey(name: 'plantVarietyId')
  @HiveField(15)
  final int plantVarietyId;

  @override
  String toString() {
    return 'PlantModel(id: $id, title: $title, biologyTitle: $biologyTitle, fertilization: $fertilization, toxicity: $toxicity, replacing: $replacing, description: $description, groupId: $groupId, wateringNeedId: $wateringNeedId, lightNeedId: $lightNeedId, stageId: $stageId, imageId: $imageId, ripeningPeriod: $ripeningPeriod, userId: $userId, plantTypeId: $plantTypeId, plantVarietyId: $plantVarietyId)';
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
                other.ripeningPeriod == ripeningPeriod) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.plantTypeId, plantTypeId) ||
                other.plantTypeId == plantTypeId) &&
            (identical(other.plantVarietyId, plantVarietyId) ||
                other.plantVarietyId == plantVarietyId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      ripeningPeriod,
      userId,
      plantTypeId,
      plantVarietyId);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantModelImplToJson(
      this,
    );
  }
}

abstract class _PlantModel extends PlantModel {
  factory _PlantModel(
      {@JsonKey(name: 'id') @HiveField(0) required final int? id,
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
      required final int ripeningPeriod,
      @JsonKey(name: 'userId') @HiveField(13) required final String userId,
      @JsonKey(name: 'plantTypeId')
      @HiveField(14)
      required final int plantTypeId,
      @JsonKey(name: 'plantVarietyId')
      @HiveField(15)
      required final int plantVarietyId}) = _$PlantModelImpl;
  _PlantModel._() : super._();

  factory _PlantModel.fromJson(Map<String, dynamic> json) =
      _$PlantModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int? get id;
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
  @JsonKey(name: 'userId')
  @HiveField(13)
  String get userId;
  @override
  @JsonKey(name: 'plantTypeId')
  @HiveField(14)
  int get plantTypeId;
  @override
  @JsonKey(name: 'plantVarietyId')
  @HiveField(15)
  int get plantVarietyId;
}
