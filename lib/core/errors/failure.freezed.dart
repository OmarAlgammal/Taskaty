// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) internetConnectionFailure,
    required TResult Function(String message) timeoutFailure,
    required TResult Function(String message) badeResponseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? internetConnectionFailure,
    TResult? Function(String message)? timeoutFailure,
    TResult? Function(String message)? badeResponseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? internetConnectionFailure,
    TResult Function(String message)? timeoutFailure,
    TResult Function(String message)? badeResponseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(InternetConnectionFailure value)
        internetConnectionFailure,
    required TResult Function(TimeoutFailure value) timeoutFailure,
    required TResult Function(BadResponseFailure value) badeResponseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult? Function(TimeoutFailure value)? timeoutFailure,
    TResult? Function(BadResponseFailure value)? badeResponseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult Function(TimeoutFailure value)? timeoutFailure,
    TResult Function(BadResponseFailure value)? badeResponseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  _$ServerFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.serverFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) internetConnectionFailure,
    required TResult Function(String message) timeoutFailure,
    required TResult Function(String message) badeResponseFailure,
  }) {
    return serverFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? internetConnectionFailure,
    TResult? Function(String message)? timeoutFailure,
    TResult? Function(String message)? badeResponseFailure,
  }) {
    return serverFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? internetConnectionFailure,
    TResult Function(String message)? timeoutFailure,
    TResult Function(String message)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(InternetConnectionFailure value)
        internetConnectionFailure,
    required TResult Function(TimeoutFailure value) timeoutFailure,
    required TResult Function(BadResponseFailure value) badeResponseFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult? Function(TimeoutFailure value)? timeoutFailure,
    TResult? Function(BadResponseFailure value)? badeResponseFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult Function(TimeoutFailure value)? timeoutFailure,
    TResult Function(BadResponseFailure value)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  factory ServerFailure({required final String message}) = _$ServerFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternetConnectionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InternetConnectionFailureImplCopyWith(
          _$InternetConnectionFailureImpl value,
          $Res Function(_$InternetConnectionFailureImpl) then) =
      __$$InternetConnectionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InternetConnectionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InternetConnectionFailureImpl>
    implements _$$InternetConnectionFailureImplCopyWith<$Res> {
  __$$InternetConnectionFailureImplCopyWithImpl(
      _$InternetConnectionFailureImpl _value,
      $Res Function(_$InternetConnectionFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InternetConnectionFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InternetConnectionFailureImpl implements InternetConnectionFailure {
  _$InternetConnectionFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.internetConnectionFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternetConnectionFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternetConnectionFailureImplCopyWith<_$InternetConnectionFailureImpl>
      get copyWith => __$$InternetConnectionFailureImplCopyWithImpl<
          _$InternetConnectionFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) internetConnectionFailure,
    required TResult Function(String message) timeoutFailure,
    required TResult Function(String message) badeResponseFailure,
  }) {
    return internetConnectionFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? internetConnectionFailure,
    TResult? Function(String message)? timeoutFailure,
    TResult? Function(String message)? badeResponseFailure,
  }) {
    return internetConnectionFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? internetConnectionFailure,
    TResult Function(String message)? timeoutFailure,
    TResult Function(String message)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (internetConnectionFailure != null) {
      return internetConnectionFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(InternetConnectionFailure value)
        internetConnectionFailure,
    required TResult Function(TimeoutFailure value) timeoutFailure,
    required TResult Function(BadResponseFailure value) badeResponseFailure,
  }) {
    return internetConnectionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult? Function(TimeoutFailure value)? timeoutFailure,
    TResult? Function(BadResponseFailure value)? badeResponseFailure,
  }) {
    return internetConnectionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult Function(TimeoutFailure value)? timeoutFailure,
    TResult Function(BadResponseFailure value)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (internetConnectionFailure != null) {
      return internetConnectionFailure(this);
    }
    return orElse();
  }
}

abstract class InternetConnectionFailure implements Failure {
  factory InternetConnectionFailure({required final String message}) =
      _$InternetConnectionFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InternetConnectionFailureImplCopyWith<_$InternetConnectionFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$TimeoutFailureImplCopyWith(_$TimeoutFailureImpl value,
          $Res Function(_$TimeoutFailureImpl) then) =
      __$$TimeoutFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeoutFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$TimeoutFailureImpl>
    implements _$$TimeoutFailureImplCopyWith<$Res> {
  __$$TimeoutFailureImplCopyWithImpl(
      _$TimeoutFailureImpl _value, $Res Function(_$TimeoutFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeoutFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeoutFailureImpl implements TimeoutFailure {
  _$TimeoutFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.timeoutFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutFailureImplCopyWith<_$TimeoutFailureImpl> get copyWith =>
      __$$TimeoutFailureImplCopyWithImpl<_$TimeoutFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) internetConnectionFailure,
    required TResult Function(String message) timeoutFailure,
    required TResult Function(String message) badeResponseFailure,
  }) {
    return timeoutFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? internetConnectionFailure,
    TResult? Function(String message)? timeoutFailure,
    TResult? Function(String message)? badeResponseFailure,
  }) {
    return timeoutFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? internetConnectionFailure,
    TResult Function(String message)? timeoutFailure,
    TResult Function(String message)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (timeoutFailure != null) {
      return timeoutFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(InternetConnectionFailure value)
        internetConnectionFailure,
    required TResult Function(TimeoutFailure value) timeoutFailure,
    required TResult Function(BadResponseFailure value) badeResponseFailure,
  }) {
    return timeoutFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult? Function(TimeoutFailure value)? timeoutFailure,
    TResult? Function(BadResponseFailure value)? badeResponseFailure,
  }) {
    return timeoutFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult Function(TimeoutFailure value)? timeoutFailure,
    TResult Function(BadResponseFailure value)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (timeoutFailure != null) {
      return timeoutFailure(this);
    }
    return orElse();
  }
}

abstract class TimeoutFailure implements Failure {
  factory TimeoutFailure({required final String message}) =
      _$TimeoutFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TimeoutFailureImplCopyWith<_$TimeoutFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadResponseFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BadResponseFailureImplCopyWith(_$BadResponseFailureImpl value,
          $Res Function(_$BadResponseFailureImpl) then) =
      __$$BadResponseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BadResponseFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadResponseFailureImpl>
    implements _$$BadResponseFailureImplCopyWith<$Res> {
  __$$BadResponseFailureImplCopyWithImpl(_$BadResponseFailureImpl _value,
      $Res Function(_$BadResponseFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BadResponseFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BadResponseFailureImpl implements BadResponseFailure {
  _$BadResponseFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.badeResponseFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadResponseFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseFailureImplCopyWith<_$BadResponseFailureImpl> get copyWith =>
      __$$BadResponseFailureImplCopyWithImpl<_$BadResponseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) internetConnectionFailure,
    required TResult Function(String message) timeoutFailure,
    required TResult Function(String message) badeResponseFailure,
  }) {
    return badeResponseFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? internetConnectionFailure,
    TResult? Function(String message)? timeoutFailure,
    TResult? Function(String message)? badeResponseFailure,
  }) {
    return badeResponseFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? internetConnectionFailure,
    TResult Function(String message)? timeoutFailure,
    TResult Function(String message)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (badeResponseFailure != null) {
      return badeResponseFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(InternetConnectionFailure value)
        internetConnectionFailure,
    required TResult Function(TimeoutFailure value) timeoutFailure,
    required TResult Function(BadResponseFailure value) badeResponseFailure,
  }) {
    return badeResponseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult? Function(TimeoutFailure value)? timeoutFailure,
    TResult? Function(BadResponseFailure value)? badeResponseFailure,
  }) {
    return badeResponseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(InternetConnectionFailure value)?
        internetConnectionFailure,
    TResult Function(TimeoutFailure value)? timeoutFailure,
    TResult Function(BadResponseFailure value)? badeResponseFailure,
    required TResult orElse(),
  }) {
    if (badeResponseFailure != null) {
      return badeResponseFailure(this);
    }
    return orElse();
  }
}

abstract class BadResponseFailure implements Failure {
  factory BadResponseFailure({required final String message}) =
      _$BadResponseFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BadResponseFailureImplCopyWith<_$BadResponseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
