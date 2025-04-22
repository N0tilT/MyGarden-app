// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'plantId')
  @HiveField(2)
  int get plantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  @HiveField(4)
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  @HiveField(3)
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'EventModelAdapter')
class _$EventModelImpl extends _EventModel {
  _$EventModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title,
      @JsonKey(name: 'plantId') @HiveField(2) required this.plantId,
      @JsonKey(name: 'userId') @HiveField(4) required this.userId,
      @JsonKey(name: 'date') @HiveField(3) required this.date})
      : super._();

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String? title;
  @override
  @JsonKey(name: 'plantId')
  @HiveField(2)
  final int plantId;
  @override
  @JsonKey(name: 'userId')
  @HiveField(4)
  final String userId;
  @override
  @JsonKey(name: 'date')
  @HiveField(3)
  final DateTime date;

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, plantId: $plantId, userId: $userId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.plantId, plantId) || other.plantId == plantId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, plantId, userId, date);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel extends EventModel {
  factory _EventModel(
          {@JsonKey(name: 'id') @HiveField(0) required final int? id,
          @JsonKey(name: 'title') @HiveField(1) required final String? title,
          @JsonKey(name: 'plantId') @HiveField(2) required final int plantId,
          @JsonKey(name: 'userId') @HiveField(4) required final String userId,
          @JsonKey(name: 'date') @HiveField(3) required final DateTime date}) =
      _$EventModelImpl;
  _EventModel._() : super._();

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int? get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;
  @override
  @JsonKey(name: 'plantId')
  @HiveField(2)
  int get plantId;
  @override
  @JsonKey(name: 'userId')
  @HiveField(4)
  String get userId;
  @override
  @JsonKey(name: 'date')
  @HiveField(3)
  DateTime get date;
}
