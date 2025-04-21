// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$GroupModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  @HiveField(2)
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this GroupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'GroupModelAdapter')
class _$GroupModelImpl extends _GroupModel {
  _$GroupModelImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'title') @HiveField(1) required this.title,
      @JsonKey(name: 'userId') @HiveField(2) required this.userId})
      : super._();

  factory _$GroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  final String? title;
  @override
  @JsonKey(name: 'userId')
  @HiveField(2)
  final String userId;

  @override
  String toString() {
    return 'GroupModel(id: $id, title: $title, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, userId);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupModelImplToJson(
      this,
    );
  }
}

abstract class _GroupModel extends GroupModel {
  factory _GroupModel(
      {@JsonKey(name: 'id') @HiveField(0) required final int? id,
      @JsonKey(name: 'title') @HiveField(1) required final String? title,
      @JsonKey(name: 'userId')
      @HiveField(2)
      required final String userId}) = _$GroupModelImpl;
  _GroupModel._() : super._();

  factory _GroupModel.fromJson(Map<String, dynamic> json) =
      _$GroupModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int? get id;
  @override
  @JsonKey(name: 'title')
  @HiveField(1)
  String? get title;
  @override
  @JsonKey(name: 'userId')
  @HiveField(2)
  String get userId;
}
