// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) internetConnectionError,
    required TResult Function(String message) timeoutError,
    required TResult Function(String message) badeResponseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? internetConnectionError,
    TResult? Function(String message)? timeoutError,
    TResult? Function(String message)? badeResponseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? internetConnectionError,
    TResult Function(String message)? timeoutError,
    TResult Function(String message)? badeResponseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(InternetConnectionError value)
        internetConnectionError,
    required TResult Function(TimeoutError value) timeoutError,
    required TResult Function(BadResponseError value) badeResponseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(InternetConnectionError value)? internetConnectionError,
    TResult? Function(TimeoutError value)? timeoutError,
    TResult? Function(BadResponseError value)? badeResponseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(InternetConnectionError value)? internetConnectionError,
    TResult Function(TimeoutError value)? timeoutError,
    TResult Function(BadResponseError value)? badeResponseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyErrorCopyWith<MyError> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyErrorCopyWith<$Res> {
  factory $MyErrorCopyWith(MyError value, $Res Function(MyError) then) =
      _$MyErrorCopyWithImpl<$Res, MyError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$MyErrorCopyWithImpl<$Res, $Val extends MyError>
    implements $MyErrorCopyWith<$Res> {
  _$MyErrorCopyWithImpl(this._value, this._then);

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
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $MyErrorCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$MyErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements ServerError {
  _$ServerErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MyError.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) internetConnectionError,
    required TResult Function(String message) timeoutError,
    required TResult Function(String message) badeResponseError,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? internetConnectionError,
    TResult? Function(String message)? timeoutError,
    TResult? Function(String message)? badeResponseError,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? internetConnectionError,
    TResult Function(String message)? timeoutError,
    TResult Function(String message)? badeResponseError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(InternetConnectionError value)
        internetConnectionError,
    required TResult Function(TimeoutError value) timeoutError,
    required TResult Function(BadResponseError value) badeResponseError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(InternetConnectionError value)? internetConnectionError,
    TResult? Function(TimeoutError value)? timeoutError,
    TResult? Function(BadResponseError value)? badeResponseError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(InternetConnectionError value)? internetConnectionError,
    TResult Function(TimeoutError value)? timeoutError,
    TResult Function(BadResponseError value)? badeResponseError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements MyError {
  factory ServerError({required final String message}) = _$ServerErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadRequestImplCopyWith<$Res>
    implements $MyErrorCopyWith<$Res> {
  factory _$$BadRequestImplCopyWith(
          _$BadRequestImpl value, $Res Function(_$BadRequestImpl) then) =
      __$$BadRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BadRequestImplCopyWithImpl<$Res>
    extends _$MyErrorCopyWithImpl<$Res, _$BadRequestImpl>
    implements _$$BadRequestImplCopyWith<$Res> {
  __$$BadRequestImplCopyWithImpl(
      _$BadRequestImpl _value, $Res Function(_$BadRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BadRequestImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BadRequestImpl implements BadRequest {
  _$BadRequestImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MyError.badRequest(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequestImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      __$$BadRequestImplCopyWithImpl<_$BadRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) internetConnectionError,
    required TResult Function(String message) timeoutError,
    required TResult Function(String message) badeResponseError,
  }) {
    return badRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? internetConnectionError,
    TResult? Function(String message)? timeoutError,
    TResult? Function(String message)? badeResponseError,
  }) {
    return badRequest?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? internetConnectionError,
    TResult Function(String message)? timeoutError,
    TResult Function(String message)? badeResponseError,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(InternetConnectionError value)
        internetConnectionError,
    required TResult Function(TimeoutError value) timeoutError,
    required TResult Function(BadResponseError value) badeResponseError,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(InternetConnectionError value)? internetConnectionError,
    TResult? Function(TimeoutError value)? timeoutError,
    TResult? Function(BadResponseError value)? badeResponseError,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(InternetConnectionError value)? internetConnectionError,
    TResult Function(TimeoutError value)? timeoutError,
    TResult Function(BadResponseError value)? badeResponseError,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class BadRequest implements MyError {
  factory BadRequest({required final String message}) = _$BadRequestImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternetConnectionErrorImplCopyWith<$Res>
    implements $MyErrorCopyWith<$Res> {
  factory _$$InternetConnectionErrorImplCopyWith(
          _$InternetConnectionErrorImpl value,
          $Res Function(_$InternetConnectionErrorImpl) then) =
      __$$InternetConnectionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InternetConnectionErrorImplCopyWithImpl<$Res>
    extends _$MyErrorCopyWithImpl<$Res, _$InternetConnectionErrorImpl>
    implements _$$InternetConnectionErrorImplCopyWith<$Res> {
  __$$InternetConnectionErrorImplCopyWithImpl(
      _$InternetConnectionErrorImpl _value,
      $Res Function(_$InternetConnectionErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InternetConnectionErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InternetConnectionErrorImpl implements InternetConnectionError {
  _$InternetConnectionErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MyError.internetConnectionError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternetConnectionErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternetConnectionErrorImplCopyWith<_$InternetConnectionErrorImpl>
      get copyWith => __$$InternetConnectionErrorImplCopyWithImpl<
          _$InternetConnectionErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) internetConnectionError,
    required TResult Function(String message) timeoutError,
    required TResult Function(String message) badeResponseError,
  }) {
    return internetConnectionError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? internetConnectionError,
    TResult? Function(String message)? timeoutError,
    TResult? Function(String message)? badeResponseError,
  }) {
    return internetConnectionError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? internetConnectionError,
    TResult Function(String message)? timeoutError,
    TResult Function(String message)? badeResponseError,
    required TResult orElse(),
  }) {
    if (internetConnectionError != null) {
      return internetConnectionError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(InternetConnectionError value)
        internetConnectionError,
    required TResult Function(TimeoutError value) timeoutError,
    required TResult Function(BadResponseError value) badeResponseError,
  }) {
    return internetConnectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(InternetConnectionError value)? internetConnectionError,
    TResult? Function(TimeoutError value)? timeoutError,
    TResult? Function(BadResponseError value)? badeResponseError,
  }) {
    return internetConnectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(InternetConnectionError value)? internetConnectionError,
    TResult Function(TimeoutError value)? timeoutError,
    TResult Function(BadResponseError value)? badeResponseError,
    required TResult orElse(),
  }) {
    if (internetConnectionError != null) {
      return internetConnectionError(this);
    }
    return orElse();
  }
}

abstract class InternetConnectionError implements MyError {
  factory InternetConnectionError({required final String message}) =
      _$InternetConnectionErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InternetConnectionErrorImplCopyWith<_$InternetConnectionErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutErrorImplCopyWith<$Res>
    implements $MyErrorCopyWith<$Res> {
  factory _$$TimeoutErrorImplCopyWith(
          _$TimeoutErrorImpl value, $Res Function(_$TimeoutErrorImpl) then) =
      __$$TimeoutErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeoutErrorImplCopyWithImpl<$Res>
    extends _$MyErrorCopyWithImpl<$Res, _$TimeoutErrorImpl>
    implements _$$TimeoutErrorImplCopyWith<$Res> {
  __$$TimeoutErrorImplCopyWithImpl(
      _$TimeoutErrorImpl _value, $Res Function(_$TimeoutErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeoutErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeoutErrorImpl implements TimeoutError {
  _$TimeoutErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MyError.timeoutError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutErrorImplCopyWith<_$TimeoutErrorImpl> get copyWith =>
      __$$TimeoutErrorImplCopyWithImpl<_$TimeoutErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) internetConnectionError,
    required TResult Function(String message) timeoutError,
    required TResult Function(String message) badeResponseError,
  }) {
    return timeoutError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? internetConnectionError,
    TResult? Function(String message)? timeoutError,
    TResult? Function(String message)? badeResponseError,
  }) {
    return timeoutError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? internetConnectionError,
    TResult Function(String message)? timeoutError,
    TResult Function(String message)? badeResponseError,
    required TResult orElse(),
  }) {
    if (timeoutError != null) {
      return timeoutError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(InternetConnectionError value)
        internetConnectionError,
    required TResult Function(TimeoutError value) timeoutError,
    required TResult Function(BadResponseError value) badeResponseError,
  }) {
    return timeoutError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(InternetConnectionError value)? internetConnectionError,
    TResult? Function(TimeoutError value)? timeoutError,
    TResult? Function(BadResponseError value)? badeResponseError,
  }) {
    return timeoutError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(InternetConnectionError value)? internetConnectionError,
    TResult Function(TimeoutError value)? timeoutError,
    TResult Function(BadResponseError value)? badeResponseError,
    required TResult orElse(),
  }) {
    if (timeoutError != null) {
      return timeoutError(this);
    }
    return orElse();
  }
}

abstract class TimeoutError implements MyError {
  factory TimeoutError({required final String message}) = _$TimeoutErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TimeoutErrorImplCopyWith<_$TimeoutErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadResponseErrorImplCopyWith<$Res>
    implements $MyErrorCopyWith<$Res> {
  factory _$$BadResponseErrorImplCopyWith(_$BadResponseErrorImpl value,
          $Res Function(_$BadResponseErrorImpl) then) =
      __$$BadResponseErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BadResponseErrorImplCopyWithImpl<$Res>
    extends _$MyErrorCopyWithImpl<$Res, _$BadResponseErrorImpl>
    implements _$$BadResponseErrorImplCopyWith<$Res> {
  __$$BadResponseErrorImplCopyWithImpl(_$BadResponseErrorImpl _value,
      $Res Function(_$BadResponseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BadResponseErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BadResponseErrorImpl implements BadResponseError {
  _$BadResponseErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MyError.badeResponseError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadResponseErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseErrorImplCopyWith<_$BadResponseErrorImpl> get copyWith =>
      __$$BadResponseErrorImplCopyWithImpl<_$BadResponseErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) internetConnectionError,
    required TResult Function(String message) timeoutError,
    required TResult Function(String message) badeResponseError,
  }) {
    return badeResponseError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? internetConnectionError,
    TResult? Function(String message)? timeoutError,
    TResult? Function(String message)? badeResponseError,
  }) {
    return badeResponseError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? internetConnectionError,
    TResult Function(String message)? timeoutError,
    TResult Function(String message)? badeResponseError,
    required TResult orElse(),
  }) {
    if (badeResponseError != null) {
      return badeResponseError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(InternetConnectionError value)
        internetConnectionError,
    required TResult Function(TimeoutError value) timeoutError,
    required TResult Function(BadResponseError value) badeResponseError,
  }) {
    return badeResponseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(InternetConnectionError value)? internetConnectionError,
    TResult? Function(TimeoutError value)? timeoutError,
    TResult? Function(BadResponseError value)? badeResponseError,
  }) {
    return badeResponseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(InternetConnectionError value)? internetConnectionError,
    TResult Function(TimeoutError value)? timeoutError,
    TResult Function(BadResponseError value)? badeResponseError,
    required TResult orElse(),
  }) {
    if (badeResponseError != null) {
      return badeResponseError(this);
    }
    return orElse();
  }
}

abstract class BadResponseError implements MyError {
  factory BadResponseError({required final String message}) =
      _$BadResponseErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BadResponseErrorImplCopyWith<_$BadResponseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
