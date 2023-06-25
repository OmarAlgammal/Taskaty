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
abstract class _$$PaymentInProgressCopyWith<$Res> {
  factory _$$PaymentInProgressCopyWith(
          _$PaymentInProgress value, $Res Function(_$PaymentInProgress) then) =
      __$$PaymentInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentInProgressCopyWithImpl<$Res>
    extends _$PaymentStatesCopyWithImpl<$Res, _$PaymentInProgress>
    implements _$$PaymentInProgressCopyWith<$Res> {
  __$$PaymentInProgressCopyWithImpl(
      _$PaymentInProgress _value, $Res Function(_$PaymentInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentInProgress implements PaymentInProgress {
  _$PaymentInProgress();

  @override
  String toString() {
    return 'PaymentStates.paymentInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentInProgress);
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
  factory PaymentInProgress() = _$PaymentInProgress;
}

/// @nodoc
abstract class _$$PaymentCompletedSuccessfullyCopyWith<$Res> {
  factory _$$PaymentCompletedSuccessfullyCopyWith(
          _$PaymentCompletedSuccessfully value,
          $Res Function(_$PaymentCompletedSuccessfully) then) =
      __$$PaymentCompletedSuccessfullyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentCompletedSuccessfullyCopyWithImpl<$Res>
    extends _$PaymentStatesCopyWithImpl<$Res, _$PaymentCompletedSuccessfully>
    implements _$$PaymentCompletedSuccessfullyCopyWith<$Res> {
  __$$PaymentCompletedSuccessfullyCopyWithImpl(
      _$PaymentCompletedSuccessfully _value,
      $Res Function(_$PaymentCompletedSuccessfully) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentCompletedSuccessfully implements PaymentCompletedSuccessfully {
  _$PaymentCompletedSuccessfully();

  @override
  String toString() {
    return 'PaymentStates.paymentCompletedSuccessfully()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCompletedSuccessfully);
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
  factory PaymentCompletedSuccessfully() = _$PaymentCompletedSuccessfully;
}

/// @nodoc
abstract class _$$PaymentFailedCopyWith<$Res> {
  factory _$$PaymentFailedCopyWith(
          _$PaymentFailed value, $Res Function(_$PaymentFailed) then) =
      __$$PaymentFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentFailedCopyWithImpl<$Res>
    extends _$PaymentStatesCopyWithImpl<$Res, _$PaymentFailed>
    implements _$$PaymentFailedCopyWith<$Res> {
  __$$PaymentFailedCopyWithImpl(
      _$PaymentFailed _value, $Res Function(_$PaymentFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentFailed implements PaymentFailed {
  _$PaymentFailed();

  @override
  String toString() {
    return 'PaymentStates.paymentFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentFailed);
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
  factory PaymentFailed() = _$PaymentFailed;
}
