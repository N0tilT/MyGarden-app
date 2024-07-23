// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlantCardEntity {
  PlantEntity get plant => throw _privateConstructorUsedError;
  List<EventEntity> get event => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlantCardEntityCopyWith<PlantCardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCardEntityCopyWith<$Res> {
  factory $PlantCardEntityCopyWith(
          PlantCardEntity value, $Res Function(PlantCardEntity) then) =
      _$PlantCardEntityCopyWithImpl<$Res, PlantCardEntity>;
  @useResult
  $Res call({PlantEntity plant, List<EventEntity> event});

  $PlantEntityCopyWith<$Res> get plant;
}

/// @nodoc
class _$PlantCardEntityCopyWithImpl<$Res, $Val extends PlantCardEntity>
    implements $PlantCardEntityCopyWith<$Res> {
  _$PlantCardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plant = null,
    Object? event = null,
  }) {
    return _then(_value.copyWith(
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as PlantEntity,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlantEntityCopyWith<$Res> get plant {
    return $PlantEntityCopyWith<$Res>(_value.plant, (value) {
      return _then(_value.copyWith(plant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlantCardEntityImplCopyWith<$Res>
    implements $PlantCardEntityCopyWith<$Res> {
  factory _$$PlantCardEntityImplCopyWith(_$PlantCardEntityImpl value,
          $Res Function(_$PlantCardEntityImpl) then) =
      __$$PlantCardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlantEntity plant, List<EventEntity> event});

  @override
  $PlantEntityCopyWith<$Res> get plant;
}

/// @nodoc
class __$$PlantCardEntityImplCopyWithImpl<$Res>
    extends _$PlantCardEntityCopyWithImpl<$Res, _$PlantCardEntityImpl>
    implements _$$PlantCardEntityImplCopyWith<$Res> {
  __$$PlantCardEntityImplCopyWithImpl(
      _$PlantCardEntityImpl _value, $Res Function(_$PlantCardEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plant = null,
    Object? event = null,
  }) {
    return _then(_$PlantCardEntityImpl(
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as PlantEntity,
      event: null == event
          ? _value._event
          : event // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
    ));
  }
}

/// @nodoc

class _$PlantCardEntityImpl extends _PlantCardEntity {
  const _$PlantCardEntityImpl(
      {required this.plant, required final List<EventEntity> event})
      : _event = event,
        super._();

  @override
  final PlantEntity plant;
  final List<EventEntity> _event;
  @override
  List<EventEntity> get event {
    if (_event is EqualUnmodifiableListView) return _event;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_event);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantCardEntityImpl &&
            (identical(other.plant, plant) || other.plant == plant) &&
            const DeepCollectionEquality().equals(other._event, _event));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, plant, const DeepCollectionEquality().hash(_event));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantCardEntityImplCopyWith<_$PlantCardEntityImpl> get copyWith =>
      __$$PlantCardEntityImplCopyWithImpl<_$PlantCardEntityImpl>(
          this, _$identity);
}

abstract class _PlantCardEntity extends PlantCardEntity {
  const factory _PlantCardEntity(
      {required final PlantEntity plant,
      required final List<EventEntity> event}) = _$PlantCardEntityImpl;
  const _PlantCardEntity._() : super._();

  @override
  PlantEntity get plant;
  @override
  List<EventEntity> get event;
  @override
  @JsonKey(ignore: true)
  _$$PlantCardEntityImplCopyWith<_$PlantCardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
