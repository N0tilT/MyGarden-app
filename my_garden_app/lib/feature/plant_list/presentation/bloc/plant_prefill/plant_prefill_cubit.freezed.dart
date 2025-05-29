// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_prefill_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlantPrefillState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlantPrefillResponseEntity plant)
        recognizeSuccess,
    required TResult Function(String message) remoteFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult? Function(String message)? remoteFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult Function(String message)? remoteFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RecognizeSuccess value) recognizeSuccess,
    required TResult Function(_Fail value) remoteFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult? Function(_Fail value)? remoteFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult Function(_Fail value)? remoteFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantPrefillStateCopyWith<$Res> {
  factory $PlantPrefillStateCopyWith(
          PlantPrefillState value, $Res Function(PlantPrefillState) then) =
      _$PlantPrefillStateCopyWithImpl<$Res, PlantPrefillState>;
}

/// @nodoc
class _$PlantPrefillStateCopyWithImpl<$Res, $Val extends PlantPrefillState>
    implements $PlantPrefillStateCopyWith<$Res> {
  _$PlantPrefillStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlantPrefillStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PlantPrefillState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlantPrefillResponseEntity plant)
        recognizeSuccess,
    required TResult Function(String message) remoteFail,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult? Function(String message)? remoteFail,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult Function(String message)? remoteFail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RecognizeSuccess value) recognizeSuccess,
    required TResult Function(_Fail value) remoteFail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult? Function(_Fail value)? remoteFail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult Function(_Fail value)? remoteFail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlantPrefillState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PlantPrefillStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PlantPrefillState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlantPrefillResponseEntity plant)
        recognizeSuccess,
    required TResult Function(String message) remoteFail,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult? Function(String message)? remoteFail,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult Function(String message)? remoteFail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RecognizeSuccess value) recognizeSuccess,
    required TResult Function(_Fail value) remoteFail,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult? Function(_Fail value)? remoteFail,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult Function(_Fail value)? remoteFail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PlantPrefillState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$RecognizeSuccessImplCopyWith<$Res> {
  factory _$$RecognizeSuccessImplCopyWith(_$RecognizeSuccessImpl value,
          $Res Function(_$RecognizeSuccessImpl) then) =
      __$$RecognizeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlantPrefillResponseEntity plant});

  $PlantPrefillResponseEntityCopyWith<$Res> get plant;
}

/// @nodoc
class __$$RecognizeSuccessImplCopyWithImpl<$Res>
    extends _$PlantPrefillStateCopyWithImpl<$Res, _$RecognizeSuccessImpl>
    implements _$$RecognizeSuccessImplCopyWith<$Res> {
  __$$RecognizeSuccessImplCopyWithImpl(_$RecognizeSuccessImpl _value,
      $Res Function(_$RecognizeSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plant = null,
  }) {
    return _then(_$RecognizeSuccessImpl(
      null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as PlantPrefillResponseEntity,
    ));
  }

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantPrefillResponseEntityCopyWith<$Res> get plant {
    return $PlantPrefillResponseEntityCopyWith<$Res>(_value.plant, (value) {
      return _then(_value.copyWith(plant: value));
    });
  }
}

/// @nodoc

class _$RecognizeSuccessImpl implements _RecognizeSuccess {
  const _$RecognizeSuccessImpl(this.plant);

  @override
  final PlantPrefillResponseEntity plant;

  @override
  String toString() {
    return 'PlantPrefillState.recognizeSuccess(plant: $plant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecognizeSuccessImpl &&
            (identical(other.plant, plant) || other.plant == plant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plant);

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecognizeSuccessImplCopyWith<_$RecognizeSuccessImpl> get copyWith =>
      __$$RecognizeSuccessImplCopyWithImpl<_$RecognizeSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlantPrefillResponseEntity plant)
        recognizeSuccess,
    required TResult Function(String message) remoteFail,
  }) {
    return recognizeSuccess(plant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult? Function(String message)? remoteFail,
  }) {
    return recognizeSuccess?.call(plant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult Function(String message)? remoteFail,
    required TResult orElse(),
  }) {
    if (recognizeSuccess != null) {
      return recognizeSuccess(plant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RecognizeSuccess value) recognizeSuccess,
    required TResult Function(_Fail value) remoteFail,
  }) {
    return recognizeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult? Function(_Fail value)? remoteFail,
  }) {
    return recognizeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult Function(_Fail value)? remoteFail,
    required TResult orElse(),
  }) {
    if (recognizeSuccess != null) {
      return recognizeSuccess(this);
    }
    return orElse();
  }
}

abstract class _RecognizeSuccess implements PlantPrefillState {
  const factory _RecognizeSuccess(final PlantPrefillResponseEntity plant) =
      _$RecognizeSuccessImpl;

  PlantPrefillResponseEntity get plant;

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecognizeSuccessImplCopyWith<_$RecognizeSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailImplCopyWith<$Res> {
  factory _$$FailImplCopyWith(
          _$FailImpl value, $Res Function(_$FailImpl) then) =
      __$$FailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailImplCopyWithImpl<$Res>
    extends _$PlantPrefillStateCopyWithImpl<$Res, _$FailImpl>
    implements _$$FailImplCopyWith<$Res> {
  __$$FailImplCopyWithImpl(_$FailImpl _value, $Res Function(_$FailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailImpl implements _Fail {
  const _$FailImpl([this.message = "Unknown error"]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PlantPrefillState.remoteFail(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailImplCopyWith<_$FailImpl> get copyWith =>
      __$$FailImplCopyWithImpl<_$FailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlantPrefillResponseEntity plant)
        recognizeSuccess,
    required TResult Function(String message) remoteFail,
  }) {
    return remoteFail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult? Function(String message)? remoteFail,
  }) {
    return remoteFail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlantPrefillResponseEntity plant)? recognizeSuccess,
    TResult Function(String message)? remoteFail,
    required TResult orElse(),
  }) {
    if (remoteFail != null) {
      return remoteFail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RecognizeSuccess value) recognizeSuccess,
    required TResult Function(_Fail value) remoteFail,
  }) {
    return remoteFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult? Function(_Fail value)? remoteFail,
  }) {
    return remoteFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RecognizeSuccess value)? recognizeSuccess,
    TResult Function(_Fail value)? remoteFail,
    required TResult orElse(),
  }) {
    if (remoteFail != null) {
      return remoteFail(this);
    }
    return orElse();
  }
}

abstract class _Fail implements PlantPrefillState {
  const factory _Fail([final String message]) = _$FailImpl;

  String get message;

  /// Create a copy of PlantPrefillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailImplCopyWith<_$FailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
