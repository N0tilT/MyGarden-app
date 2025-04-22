// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupStateCopyWith<$Res> {
  factory $GroupStateCopyWith(
          GroupState value, $Res Function(GroupState) then) =
      _$GroupStateCopyWithImpl<$Res, GroupState>;
}

/// @nodoc
class _$GroupStateCopyWithImpl<$Res, $Val extends GroupState>
    implements $GroupStateCopyWith<$Res> {
  _$GroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GroupInitialImplCopyWith<$Res> {
  factory _$$GroupInitialImplCopyWith(
          _$GroupInitialImpl value, $Res Function(_$GroupInitialImpl) then) =
      __$$GroupInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupInitialImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupInitialImpl>
    implements _$$GroupInitialImplCopyWith<$Res> {
  __$$GroupInitialImplCopyWithImpl(
      _$GroupInitialImpl _value, $Res Function(_$GroupInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupInitialImpl implements GroupInitial {
  const _$GroupInitialImpl();

  @override
  String toString() {
    return 'GroupState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GroupInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
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
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GroupInitial implements GroupState {
  const factory GroupInitial() = _$GroupInitialImpl;
}

/// @nodoc
abstract class _$$GroupLoadingImplCopyWith<$Res> {
  factory _$$GroupLoadingImplCopyWith(
          _$GroupLoadingImpl value, $Res Function(_$GroupLoadingImpl) then) =
      __$$GroupLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupLoadingImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupLoadingImpl>
    implements _$$GroupLoadingImplCopyWith<$Res> {
  __$$GroupLoadingImplCopyWithImpl(
      _$GroupLoadingImpl _value, $Res Function(_$GroupLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupLoadingImpl implements GroupLoading {
  const _$GroupLoadingImpl();

  @override
  String toString() {
    return 'GroupState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GroupLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
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
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GroupLoading implements GroupState {
  const factory GroupLoading() = _$GroupLoadingImpl;
}

/// @nodoc
abstract class _$$GroupSuccessImplCopyWith<$Res> {
  factory _$$GroupSuccessImplCopyWith(
          _$GroupSuccessImpl value, $Res Function(_$GroupSuccessImpl) then) =
      __$$GroupSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GroupEntity> plants});
}

/// @nodoc
class __$$GroupSuccessImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupSuccessImpl>
    implements _$$GroupSuccessImplCopyWith<$Res> {
  __$$GroupSuccessImplCopyWithImpl(
      _$GroupSuccessImpl _value, $Res Function(_$GroupSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plants = null,
  }) {
    return _then(_$GroupSuccessImpl(
      null == plants
          ? _value._plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<GroupEntity>,
    ));
  }
}

/// @nodoc

class _$GroupSuccessImpl implements GroupSuccess {
  const _$GroupSuccessImpl(final List<GroupEntity> plants) : _plants = plants;

  final List<GroupEntity> _plants;
  @override
  List<GroupEntity> get plants {
    if (_plants is EqualUnmodifiableListView) return _plants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plants);
  }

  @override
  String toString() {
    return 'GroupState.success(plants: $plants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupSuccessImpl &&
            const DeepCollectionEquality().equals(other._plants, _plants));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_plants));

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupSuccessImplCopyWith<_$GroupSuccessImpl> get copyWith =>
      __$$GroupSuccessImplCopyWithImpl<_$GroupSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) {
    return success(plants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) {
    return success?.call(plants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(plants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GroupSuccess implements GroupState {
  const factory GroupSuccess(final List<GroupEntity> plants) =
      _$GroupSuccessImpl;

  List<GroupEntity> get plants;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupSuccessImplCopyWith<_$GroupSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupFailImplCopyWith<$Res> {
  factory _$$GroupFailImplCopyWith(
          _$GroupFailImpl value, $Res Function(_$GroupFailImpl) then) =
      __$$GroupFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GroupFailImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupFailImpl>
    implements _$$GroupFailImplCopyWith<$Res> {
  __$$GroupFailImplCopyWithImpl(
      _$GroupFailImpl _value, $Res Function(_$GroupFailImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GroupFailImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GroupFailImpl implements GroupFail {
  const _$GroupFailImpl([this.message = "Unknown error"]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'GroupState.remoteFail(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupFailImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupFailImplCopyWith<_$GroupFailImpl> get copyWith =>
      __$$GroupFailImplCopyWithImpl<_$GroupFailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) {
    return remoteFail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) {
    return remoteFail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
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
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) {
    return remoteFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) {
    return remoteFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (remoteFail != null) {
      return remoteFail(this);
    }
    return orElse();
  }
}

abstract class GroupFail implements GroupState {
  const factory GroupFail([final String message]) = _$GroupFailImpl;

  String get message;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupFailImplCopyWith<_$GroupFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupLocalLoadingFailImplCopyWith<$Res> {
  factory _$$GroupLocalLoadingFailImplCopyWith(
          _$GroupLocalLoadingFailImpl value,
          $Res Function(_$GroupLocalLoadingFailImpl) then) =
      __$$GroupLocalLoadingFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GroupLocalLoadingFailImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupLocalLoadingFailImpl>
    implements _$$GroupLocalLoadingFailImplCopyWith<$Res> {
  __$$GroupLocalLoadingFailImplCopyWithImpl(_$GroupLocalLoadingFailImpl _value,
      $Res Function(_$GroupLocalLoadingFailImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GroupLocalLoadingFailImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GroupLocalLoadingFailImpl implements GroupLocalLoadingFail {
  const _$GroupLocalLoadingFailImpl([this.message = "Unknown error"]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'GroupState.fail(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupLocalLoadingFailImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupLocalLoadingFailImplCopyWith<_$GroupLocalLoadingFailImpl>
      get copyWith => __$$GroupLocalLoadingFailImplCopyWithImpl<
          _$GroupLocalLoadingFailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) {
    return fail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) {
    return fail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class GroupLocalLoadingFail implements GroupState {
  const factory GroupLocalLoadingFail([final String message]) =
      _$GroupLocalLoadingFailImpl;

  String get message;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupLocalLoadingFailImplCopyWith<_$GroupLocalLoadingFailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupLocalLoadingSuccessImplCopyWith<$Res> {
  factory _$$GroupLocalLoadingSuccessImplCopyWith(
          _$GroupLocalLoadingSuccessImpl value,
          $Res Function(_$GroupLocalLoadingSuccessImpl) then) =
      __$$GroupLocalLoadingSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GroupEntity> departments});
}

/// @nodoc
class __$$GroupLocalLoadingSuccessImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupLocalLoadingSuccessImpl>
    implements _$$GroupLocalLoadingSuccessImplCopyWith<$Res> {
  __$$GroupLocalLoadingSuccessImplCopyWithImpl(
      _$GroupLocalLoadingSuccessImpl _value,
      $Res Function(_$GroupLocalLoadingSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departments = null,
  }) {
    return _then(_$GroupLocalLoadingSuccessImpl(
      null == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<GroupEntity>,
    ));
  }
}

/// @nodoc

class _$GroupLocalLoadingSuccessImpl implements GroupLocalLoadingSuccess {
  const _$GroupLocalLoadingSuccessImpl(final List<GroupEntity> departments)
      : _departments = departments;

  final List<GroupEntity> _departments;
  @override
  List<GroupEntity> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  @override
  String toString() {
    return 'GroupState.localLoadingSuccess(departments: $departments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupLocalLoadingSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_departments));

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupLocalLoadingSuccessImplCopyWith<_$GroupLocalLoadingSuccessImpl>
      get copyWith => __$$GroupLocalLoadingSuccessImplCopyWithImpl<
          _$GroupLocalLoadingSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GroupEntity> plants) success,
    required TResult Function(String message) remoteFail,
    required TResult Function(String message) fail,
    required TResult Function(List<GroupEntity> departments)
        localLoadingSuccess,
  }) {
    return localLoadingSuccess(departments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GroupEntity> plants)? success,
    TResult? Function(String message)? remoteFail,
    TResult? Function(String message)? fail,
    TResult? Function(List<GroupEntity> departments)? localLoadingSuccess,
  }) {
    return localLoadingSuccess?.call(departments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GroupEntity> plants)? success,
    TResult Function(String message)? remoteFail,
    TResult Function(String message)? fail,
    TResult Function(List<GroupEntity> departments)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (localLoadingSuccess != null) {
      return localLoadingSuccess(departments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupInitial value) initial,
    required TResult Function(GroupLoading value) loading,
    required TResult Function(GroupSuccess value) success,
    required TResult Function(GroupFail value) remoteFail,
    required TResult Function(GroupLocalLoadingFail value) fail,
    required TResult Function(GroupLocalLoadingSuccess value)
        localLoadingSuccess,
  }) {
    return localLoadingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupInitial value)? initial,
    TResult? Function(GroupLoading value)? loading,
    TResult? Function(GroupSuccess value)? success,
    TResult? Function(GroupFail value)? remoteFail,
    TResult? Function(GroupLocalLoadingFail value)? fail,
    TResult? Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
  }) {
    return localLoadingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupInitial value)? initial,
    TResult Function(GroupLoading value)? loading,
    TResult Function(GroupSuccess value)? success,
    TResult Function(GroupFail value)? remoteFail,
    TResult Function(GroupLocalLoadingFail value)? fail,
    TResult Function(GroupLocalLoadingSuccess value)? localLoadingSuccess,
    required TResult orElse(),
  }) {
    if (localLoadingSuccess != null) {
      return localLoadingSuccess(this);
    }
    return orElse();
  }
}

abstract class GroupLocalLoadingSuccess implements GroupState {
  const factory GroupLocalLoadingSuccess(final List<GroupEntity> departments) =
      _$GroupLocalLoadingSuccessImpl;

  List<GroupEntity> get departments;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupLocalLoadingSuccessImplCopyWith<_$GroupLocalLoadingSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
