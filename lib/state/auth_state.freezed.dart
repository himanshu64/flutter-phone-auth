// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(CountryWithPhoneCode country) ready,
    required TResult Function(String errorText) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializing,
    TResult? Function(CountryWithPhoneCode country)? ready,
    TResult? Function(String errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(CountryWithPhoneCode country)? ready,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitializing value) initializing,
    required TResult Function(_AuthStateReady value) ready,
    required TResult Function(_AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateInitializing value)? initializing,
    TResult? Function(_AuthStateReady value)? ready,
    TResult? Function(_AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitializing value)? initializing,
    TResult Function(_AuthStateReady value)? ready,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateInitializingImplCopyWith<$Res> {
  factory _$$AuthStateInitializingImplCopyWith(
          _$AuthStateInitializingImpl value,
          $Res Function(_$AuthStateInitializingImpl) then) =
      __$$AuthStateInitializingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitializingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitializingImpl>
    implements _$$AuthStateInitializingImplCopyWith<$Res> {
  __$$AuthStateInitializingImplCopyWithImpl(_$AuthStateInitializingImpl _value,
      $Res Function(_$AuthStateInitializingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateInitializingImpl implements _AuthStateInitializing {
  const _$AuthStateInitializingImpl();

  @override
  String toString() {
    return 'AuthState.initializing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateInitializingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(CountryWithPhoneCode country) ready,
    required TResult Function(String errorText) error,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializing,
    TResult? Function(CountryWithPhoneCode country)? ready,
    TResult? Function(String errorText)? error,
  }) {
    return initializing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(CountryWithPhoneCode country)? ready,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitializing value) initializing,
    required TResult Function(_AuthStateReady value) ready,
    required TResult Function(_AuthStateError value) error,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateInitializing value)? initializing,
    TResult? Function(_AuthStateReady value)? ready,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitializing value)? initializing,
    TResult Function(_AuthStateReady value)? ready,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class _AuthStateInitializing implements AuthState {
  const factory _AuthStateInitializing() = _$AuthStateInitializingImpl;
}

/// @nodoc
abstract class _$$AuthStateReadyImplCopyWith<$Res> {
  factory _$$AuthStateReadyImplCopyWith(_$AuthStateReadyImpl value,
          $Res Function(_$AuthStateReadyImpl) then) =
      __$$AuthStateReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountryWithPhoneCode country});
}

/// @nodoc
class __$$AuthStateReadyImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateReadyImpl>
    implements _$$AuthStateReadyImplCopyWith<$Res> {
  __$$AuthStateReadyImplCopyWithImpl(
      _$AuthStateReadyImpl _value, $Res Function(_$AuthStateReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
  }) {
    return _then(_$AuthStateReadyImpl(
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryWithPhoneCode,
    ));
  }
}

/// @nodoc

class _$AuthStateReadyImpl implements _AuthStateReady {
  const _$AuthStateReadyImpl(this.country);

  @override
  final CountryWithPhoneCode country;

  @override
  String toString() {
    return 'AuthState.ready(country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateReadyImpl &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateReadyImplCopyWith<_$AuthStateReadyImpl> get copyWith =>
      __$$AuthStateReadyImplCopyWithImpl<_$AuthStateReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(CountryWithPhoneCode country) ready,
    required TResult Function(String errorText) error,
  }) {
    return ready(country);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializing,
    TResult? Function(CountryWithPhoneCode country)? ready,
    TResult? Function(String errorText)? error,
  }) {
    return ready?.call(country);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(CountryWithPhoneCode country)? ready,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitializing value) initializing,
    required TResult Function(_AuthStateReady value) ready,
    required TResult Function(_AuthStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateInitializing value)? initializing,
    TResult? Function(_AuthStateReady value)? ready,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitializing value)? initializing,
    TResult Function(_AuthStateReady value)? ready,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _AuthStateReady implements AuthState {
  const factory _AuthStateReady(final CountryWithPhoneCode country) =
      _$AuthStateReadyImpl;

  CountryWithPhoneCode get country;
  @JsonKey(ignore: true)
  _$$AuthStateReadyImplCopyWith<_$AuthStateReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateErrorImplCopyWith<$Res> {
  factory _$$AuthStateErrorImplCopyWith(_$AuthStateErrorImpl value,
          $Res Function(_$AuthStateErrorImpl) then) =
      __$$AuthStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorText});
}

/// @nodoc
class __$$AuthStateErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateErrorImpl>
    implements _$$AuthStateErrorImplCopyWith<$Res> {
  __$$AuthStateErrorImplCopyWithImpl(
      _$AuthStateErrorImpl _value, $Res Function(_$AuthStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = null,
  }) {
    return _then(_$AuthStateErrorImpl(
      null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateErrorImpl implements _AuthStateError {
  const _$AuthStateErrorImpl(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'AuthState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateErrorImpl &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      __$$AuthStateErrorImplCopyWithImpl<_$AuthStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(CountryWithPhoneCode country) ready,
    required TResult Function(String errorText) error,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializing,
    TResult? Function(CountryWithPhoneCode country)? ready,
    TResult? Function(String errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(CountryWithPhoneCode country)? ready,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitializing value) initializing,
    required TResult Function(_AuthStateReady value) ready,
    required TResult Function(_AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateInitializing value)? initializing,
    TResult? Function(_AuthStateReady value)? ready,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitializing value)? initializing,
    TResult Function(_AuthStateReady value)? ready,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthStateError implements AuthState {
  const factory _AuthStateError(final String errorText) = _$AuthStateErrorImpl;

  String get errorText;
  @JsonKey(ignore: true)
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
