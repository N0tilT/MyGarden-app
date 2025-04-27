// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garden_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GardenEntity {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<FlowerBedEntity> get flowerBeds => throw _privateConstructorUsedError;
  int get gardenTypeId => throw _privateConstructorUsedError;
  String? get gardenTypeTitle => throw _privateConstructorUsedError;

  /// Create a copy of GardenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GardenEntityCopyWith<GardenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GardenEntityCopyWith<$Res> {
  factory $GardenEntityCopyWith(
          GardenEntity value, $Res Function(GardenEntity) then) =
      _$GardenEntityCopyWithImpl<$Res, GardenEntity>;
  @useResult
  $Res call(
      {int? id,
      String title,
      List<FlowerBedEntity> flowerBeds,
      int gardenTypeId,
      String? gardenTypeTitle});
}

/// @nodoc
class _$GardenEntityCopyWithImpl<$Res, $Val extends GardenEntity>
    implements $GardenEntityCopyWith<$Res> {
  _$GardenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GardenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? flowerBeds = null,
    Object? gardenTypeId = null,
    Object? gardenTypeTitle = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      flowerBeds: null == flowerBeds
          ? _value.flowerBeds
          : flowerBeds // ignore: cast_nullable_to_non_nullable
              as List<FlowerBedEntity>,
      gardenTypeId: null == gardenTypeId
          ? _value.gardenTypeId
          : gardenTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      gardenTypeTitle: freezed == gardenTypeTitle
          ? _value.gardenTypeTitle
          : gardenTypeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GardenEntityImplCopyWith<$Res>
    implements $GardenEntityCopyWith<$Res> {
  factory _$$GardenEntityImplCopyWith(
          _$GardenEntityImpl value, $Res Function(_$GardenEntityImpl) then) =
      __$$GardenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      List<FlowerBedEntity> flowerBeds,
      int gardenTypeId,
      String? gardenTypeTitle});
}

/// @nodoc
class __$$GardenEntityImplCopyWithImpl<$Res>
    extends _$GardenEntityCopyWithImpl<$Res, _$GardenEntityImpl>
    implements _$$GardenEntityImplCopyWith<$Res> {
  __$$GardenEntityImplCopyWithImpl(
      _$GardenEntityImpl _value, $Res Function(_$GardenEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GardenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? flowerBeds = null,
    Object? gardenTypeId = null,
    Object? gardenTypeTitle = freezed,
  }) {
    return _then(_$GardenEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      flowerBeds: null == flowerBeds
          ? _value._flowerBeds
          : flowerBeds // ignore: cast_nullable_to_non_nullable
              as List<FlowerBedEntity>,
      gardenTypeId: null == gardenTypeId
          ? _value.gardenTypeId
          : gardenTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      gardenTypeTitle: freezed == gardenTypeTitle
          ? _value.gardenTypeTitle
          : gardenTypeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GardenEntityImpl implements _GardenEntity {
  const _$GardenEntityImpl(
      {required this.id,
      required this.title,
      required final List<FlowerBedEntity> flowerBeds,
      required this.gardenTypeId,
      this.gardenTypeTitle})
      : _flowerBeds = flowerBeds;

  @override
  final int? id;
  @override
  final String title;
  final List<FlowerBedEntity> _flowerBeds;
  @override
  List<FlowerBedEntity> get flowerBeds {
    if (_flowerBeds is EqualUnmodifiableListView) return _flowerBeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flowerBeds);
  }

  @override
  final int gardenTypeId;
  @override
  final String? gardenTypeTitle;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GardenEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._flowerBeds, _flowerBeds) &&
            (identical(other.gardenTypeId, gardenTypeId) ||
                other.gardenTypeId == gardenTypeId) &&
            (identical(other.gardenTypeTitle, gardenTypeTitle) ||
                other.gardenTypeTitle == gardenTypeTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_flowerBeds),
      gardenTypeId,
      gardenTypeTitle);

  /// Create a copy of GardenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GardenEntityImplCopyWith<_$GardenEntityImpl> get copyWith =>
      __$$GardenEntityImplCopyWithImpl<_$GardenEntityImpl>(this, _$identity);
}

abstract class _GardenEntity implements GardenEntity {
  const factory _GardenEntity(
      {required final int? id,
      required final String title,
      required final List<FlowerBedEntity> flowerBeds,
      required final int gardenTypeId,
      final String? gardenTypeTitle}) = _$GardenEntityImpl;

  @override
  int? get id;
  @override
  String get title;
  @override
  List<FlowerBedEntity> get flowerBeds;
  @override
  int get gardenTypeId;
  @override
  String? get gardenTypeTitle;

  /// Create a copy of GardenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GardenEntityImplCopyWith<_$GardenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
