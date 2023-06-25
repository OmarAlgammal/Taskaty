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
abstract class _$$ServerFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureCopyWith(
          _$ServerFailure value, $Res Function(_$ServerFailure) then) =
      __$$ServerFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailure>
    implements _$$ServerFailureCopyWith<$Res> {
  __$$ServerFailureCopyWithImpl(
      _$ServerFailure _value, $Res Function(_$ServerFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerFailure implements ServerFailure {
  _$ServerFailure({required this.message});

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
            other is _$ServerFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureCopyWith<_$ServerFailure> get copyWith =>
      __$$ServerFailureCopyWithImpl<_$ServerFailure>(this, _$identity);

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
  factory ServerFailure({required final String message}) = _$ServerFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureCopyWith<_$ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternetConnectionFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InternetConnectionFailureCopyWith(
          _$InternetConnectionFailure value,
          $Res Function(_$InternetConnectionFailure) then) =
      __$$InternetConnectionFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InternetConnectionFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InternetConnectionFailure>
    implements _$$InternetConnectionFailureCopyWith<$Res> {
  __$$InternetConnectionFailureCopyWithImpl(_$InternetConnectionFailure _value,
      $Res Function(_$InternetConnectionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InternetConnectionFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InternetConnectionFailure implements InternetConnectionFailure {
  _$InternetConnectionFailure({required this.message});

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
            other is _$InternetConnectionFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternetConnectionFailureCopyWith<_$InternetConnectionFailure>
      get copyWith => __$$InternetConnectionFailureCopyWithImpl<
          _$InternetConnectionFailure>(this, _$identity);

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
      _$InternetConnectionFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InternetConnectionFailureCopyWith<_$InternetConnectionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$TimeoutFailureCopyWith(
          _$TimeoutFailure value, $Res Function(_$TimeoutFailure) then) =
      __$$TimeoutFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeoutFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$TimeoutFailure>
    implements _$$TimeoutFailureCopyWith<$Res> {
  __$$TimeoutFailureCopyWithImpl(
      _$TimeoutFailure _value, $Res Function(_$TimeoutFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeoutFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeoutFailure implements TimeoutFailure {
  _$TimeoutFailure({required this.message});

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
            other is _$TimeoutFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutFailureCopyWith<_$TimeoutFailure> get copyWith =>
      __$$TimeoutFailureCopyWithImpl<_$TimeoutFailure>(this, _$identity);

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
  factory TimeoutFailure({required final String message}) = _$TimeoutFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TimeoutFailureCopyWith<_$TimeoutFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadResponseFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BadResponseFailureCopyWith(_$BadResponseFailure value,
          $Res Function(_$BadResponseFailure) then) =
      __$$BadResponseFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BadResponseFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadResponseFailure>
    implements _$$BadResponseFailureCopyWith<$Res> {
  __$$BadResponseFailureCopyWithImpl(
      _$BadResponseFailure _value, $Res Function(_$BadResponseFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BadResponseFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BadResponseFailure implements BadResponseFailure {
  _$BadResponseFailure({required this.message});

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
            other is _$BadResponseFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseFailureCopyWith<_$BadResponseFailure> get copyWith =>
      __$$BadResponseFailureCopyWithImpl<_$BadResponseFailure>(
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
      _$BadResponseFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BadResponseFailureCopyWith<_$BadResponseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
