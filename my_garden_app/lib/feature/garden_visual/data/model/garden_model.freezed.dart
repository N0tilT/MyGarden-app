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
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'flowerBeds')
  @HiveField(2)
  List<FlowerBedModel> get flowerBeds => throw _privateConstructorUsedError;
  @JsonKey(name: 'gardenTypeId')
  @HiveField(3)
  int get gardenTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  @HiveField(4)
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this GardenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4, adapterName: 'GardenModelAdapter')
class _$GardenModelImpl extends _GardenModel {
  _$GardenModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title,
      @JsonKey(name: 'flowerBeds')
      @HiveField(2)
      required final List<FlowerBedModel> flowerBeds,
      @JsonKey(name: 'gardenTypeId') @HiveField(3) required this.gardenTypeId,
      @JsonKey(name: 'userId') @HiveField(4) required this.userId})
      : _flowerBeds = flowerBeds,
        super._();

  factory _$GardenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GardenModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String title;
  final List<FlowerBedModel> _flowerBeds;
  @override
  @JsonKey(name: 'flowerBeds')
  @HiveField(2)
  List<FlowerBedModel> get flowerBeds {
    if (_flowerBeds is EqualUnmodifiableListView) return _flowerBeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flowerBeds);
  }

  @override
  @JsonKey(name: 'gardenTypeId')
  @HiveField(3)
  final int gardenTypeId;
  @override
  @JsonKey(name: 'userId')
  @HiveField(4)
  final String userId;

  @override
  String toString() {
    return 'GardenModel(id: $id, title: $title, flowerBeds: $flowerBeds, gardenTypeId: $gardenTypeId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GardenModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._flowerBeds, _flowerBeds) &&
            (identical(other.gardenTypeId, gardenTypeId) ||
                other.gardenTypeId == gardenTypeId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_flowerBeds), gardenTypeId, userId);

  @override
  Map<String, dynamic> toJson() {
    return _$$GardenModelImplToJson(
      this,
    );
  }
}

abstract class _GardenModel extends GardenModel {
  factory _GardenModel(
      {@JsonKey(name: 'id') @HiveField(0) required final int? id,
      @JsonKey(name: 'title') @HiveField(1) required final String title,
      @JsonKey(name: 'flowerBeds')
      @HiveField(2)
      required final List<FlowerBedModel> flowerBeds,
      @JsonKey(name: 'gardenTypeId')
      @HiveField(3)
      required final int gardenTypeId,
      @JsonKey(name: 'userId')
      @HiveField(4)
      required final String userId}) = _$GardenModelImpl;
  _GardenModel._() : super._();

  factory _GardenModel.fromJson(Map<String, dynamic> json) =
      _$GardenModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int? get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String get title;
  @override
  @JsonKey(name: 'flowerBeds')
  @HiveField(2)
  List<FlowerBedModel> get flowerBeds;
  @override
  @JsonKey(name: 'gardenTypeId')
  @HiveField(3)
  int get gardenTypeId;
  @override
  @JsonKey(name: 'userId')
  @HiveField(4)
  String get userId;
}
