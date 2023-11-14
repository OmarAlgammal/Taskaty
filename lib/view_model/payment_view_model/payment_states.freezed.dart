// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() paymentInProgress,
    required TResult Function() paymentCompletedSuccessfully,
    required TResult Function() paymentFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? paymentInProgress,
    TResult? Function()? paymentCompletedSuccessfully,
    TResult? Function()? paymentFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? paymentInProgress,
    TResult Function()? paymentCompletedSuccessfully,
    TResult Function()? paymentFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInProgress value) paymentInProgress,
    required TResult Function(PaymentCompletedSuccessfully value)
        paymentCompletedSuccessfully,
    required TResult Function(PaymentFailed value) paymentFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInProgress value)? paymentInProgress,
    TResult? Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult? Function(PaymentFailed value)? paymentFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInProgress value)? paymentInProgress,
    TResult Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult Function(PaymentFailed value)? paymentFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatesCopyWith<$Res> {
  factory $PaymentStatesCopyWith(
          PaymentStates value, $Res Function(PaymentStates) then) =
      _$PaymentStatesCopyWithImpl<$Res, PaymentStates>;
}

/// @nodoc
class _$PaymentStatesCopyWithImpl<$Res, $Val extends PaymentStates>
    implements $PaymentStatesCopyWith<$Res> {
  _$PaymentStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PaymentInProgressImplCopyWith<$Res> {
  factory _$$PaymentInProgressImplCopyWith(_$PaymentInProgressImpl value,
          $Res Function(_$PaymentInProgressImpl) then) =
      __$$PaymentInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentInProgressImplCopyWithImpl<$Res>
    extends _$PaymentStatesCopyWithImpl<$Res, _$PaymentInProgressImpl>
    implements _$$PaymentInProgressImplCopyWith<$Res> {
  __$$PaymentInProgressImplCopyWithImpl(_$PaymentInProgressImpl _value,
      $Res Function(_$PaymentInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentInProgressImpl implements PaymentInProgress {
  _$PaymentInProgressImpl();

  @override
  String toString() {
    return 'PaymentStates.paymentInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() paymentInProgress,
    required TResult Function() paymentCompletedSuccessfully,
    required TResult Function() paymentFailed,
  }) {
    return paymentInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? paymentInProgress,
    TResult? Function()? paymentCompletedSuccessfully,
    TResult? Function()? paymentFailed,
  }) {
    return paymentInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? paymentInProgress,
    TResult Function()? paymentCompletedSuccessfully,
    TResult Function()? paymentFailed,
    required TResult orElse(),
  }) {
    if (paymentInProgress != null) {
      return paymentInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInProgress value) paymentInProgress,
    required TResult Function(PaymentCompletedSuccessfully value)
        paymentCompletedSuccessfully,
    required TResult Function(PaymentFailed value) paymentFailed,
  }) {
    return paymentInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInProgress value)? paymentInProgress,
    TResult? Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult? Function(PaymentFailed value)? paymentFailed,
  }) {
    return paymentInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInProgress value)? paymentInProgress,
    TResult Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult Function(PaymentFailed value)? paymentFailed,
    required TResult orElse(),
  }) {
    if (paymentInProgress != null) {
      return paymentInProgress(this);
    }
    return orElse();
  }
}

abstract class PaymentInProgress implements PaymentStates {
  factory PaymentInProgress() = _$PaymentInProgressImpl;
}

/// @nodoc
abstract class _$$PaymentCompletedSuccessfullyImplCopyWith<$Res> {
  factory _$$PaymentCompletedSuccessfullyImplCopyWith(
          _$PaymentCompletedSuccessfullyImpl value,
          $Res Function(_$PaymentCompletedSuccessfullyImpl) then) =
      __$$PaymentCompletedSuccessfullyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentCompletedSuccessfullyImplCopyWithImpl<$Res>
    extends _$PaymentStatesCopyWithImpl<$Res,
        _$PaymentCompletedSuccessfullyImpl>
    implements _$$PaymentCompletedSuccessfullyImplCopyWith<$Res> {
  __$$PaymentCompletedSuccessfullyImplCopyWithImpl(
      _$PaymentCompletedSuccessfullyImpl _value,
      $Res Function(_$PaymentCompletedSuccessfullyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentCompletedSuccessfullyImpl
    implements PaymentCompletedSuccessfully {
  _$PaymentCompletedSuccessfullyImpl();

  @override
  String toString() {
    return 'PaymentStates.paymentCompletedSuccessfully()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCompletedSuccessfullyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() paymentInProgress,
    required TResult Function() paymentCompletedSuccessfully,
    required TResult Function() paymentFailed,
  }) {
    return paymentCompletedSuccessfully();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? paymentInProgress,
    TResult? Function()? paymentCompletedSuccessfully,
    TResult? Function()? paymentFailed,
  }) {
    return paymentCompletedSuccessfully?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? paymentInProgress,
    TResult Function()? paymentCompletedSuccessfully,
    TResult Function()? paymentFailed,
    required TResult orElse(),
  }) {
    if (paymentCompletedSuccessfully != null) {
      return paymentCompletedSuccessfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInProgress value) paymentInProgress,
    required TResult Function(PaymentCompletedSuccessfully value)
        paymentCompletedSuccessfully,
    required TResult Function(PaymentFailed value) paymentFailed,
  }) {
    return paymentCompletedSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInProgress value)? paymentInProgress,
    TResult? Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult? Function(PaymentFailed value)? paymentFailed,
  }) {
    return paymentCompletedSuccessfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInProgress value)? paymentInProgress,
    TResult Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult Function(PaymentFailed value)? paymentFailed,
    required TResult orElse(),
  }) {
    if (paymentCompletedSuccessfully != null) {
      return paymentCompletedSuccessfully(this);
    }
    return orElse();
  }
}

abstract class PaymentCompletedSuccessfully implements PaymentStates {
  factory PaymentCompletedSuccessfully() = _$PaymentCompletedSuccessfullyImpl;
}

/// @nodoc
abstract class _$$PaymentFailedImplCopyWith<$Res> {
  factory _$$PaymentFailedImplCopyWith(
          _$PaymentFailedImpl value, $Res Function(_$PaymentFailedImpl) then) =
      __$$PaymentFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentFailedImplCopyWithImpl<$Res>
    extends _$PaymentStatesCopyWithImpl<$Res, _$PaymentFailedImpl>
    implements _$$PaymentFailedImplCopyWith<$Res> {
  __$$PaymentFailedImplCopyWithImpl(
      _$PaymentFailedImpl _value, $Res Function(_$PaymentFailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentFailedImpl implements PaymentFailed {
  _$PaymentFailedImpl();

  @override
  String toString() {
    return 'PaymentStates.paymentFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() paymentInProgress,
    required TResult Function() paymentCompletedSuccessfully,
    required TResult Function() paymentFailed,
  }) {
    return paymentFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? paymentInProgress,
    TResult? Function()? paymentCompletedSuccessfully,
    TResult? Function()? paymentFailed,
  }) {
    return paymentFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? paymentInProgress,
    TResult Function()? paymentCompletedSuccessfully,
    TResult Function()? paymentFailed,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInProgress value) paymentInProgress,
    required TResult Function(PaymentCompletedSuccessfully value)
        paymentCompletedSuccessfully,
    required TResult Function(PaymentFailed value) paymentFailed,
  }) {
    return paymentFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInProgress value)? paymentInProgress,
    TResult? Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult? Function(PaymentFailed value)? paymentFailed,
  }) {
    return paymentFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInProgress value)? paymentInProgress,
    TResult Function(PaymentCompletedSuccessfully value)?
        paymentCompletedSuccessfully,
    TResult Function(PaymentFailed value)? paymentFailed,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(this);
    }
    return orElse();
  }
}

abstract class PaymentFailed implements PaymentStates {
  factory PaymentFailed() = _$PaymentFailedImpl;
}
