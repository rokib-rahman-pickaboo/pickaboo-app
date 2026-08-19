// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_drawer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NavDrawerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() openDrawer,
    required TResult Function() closeDrawer,
    required TResult Function() toggleDrawer,
    required TResult Function(bool isOpen) drawerChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? openDrawer,
    TResult? Function()? closeDrawer,
    TResult? Function()? toggleDrawer,
    TResult? Function(bool isOpen)? drawerChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? openDrawer,
    TResult Function()? closeDrawer,
    TResult Function()? toggleDrawer,
    TResult Function(bool isOpen)? drawerChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CloseDrawer value) closeDrawer,
    required TResult Function(_ToggleDrawer value) toggleDrawer,
    required TResult Function(_DrawerChanged value) drawerChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CloseDrawer value)? closeDrawer,
    TResult? Function(_ToggleDrawer value)? toggleDrawer,
    TResult? Function(_DrawerChanged value)? drawerChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CloseDrawer value)? closeDrawer,
    TResult Function(_ToggleDrawer value)? toggleDrawer,
    TResult Function(_DrawerChanged value)? drawerChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavDrawerEventCopyWith<$Res> {
  factory $NavDrawerEventCopyWith(
    NavDrawerEvent value,
    $Res Function(NavDrawerEvent) then,
  ) = _$NavDrawerEventCopyWithImpl<$Res, NavDrawerEvent>;
}

/// @nodoc
class _$NavDrawerEventCopyWithImpl<$Res, $Val extends NavDrawerEvent>
    implements $NavDrawerEventCopyWith<$Res> {
  _$NavDrawerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OpenDrawerImplCopyWith<$Res> {
  factory _$$OpenDrawerImplCopyWith(
    _$OpenDrawerImpl value,
    $Res Function(_$OpenDrawerImpl) then,
  ) = __$$OpenDrawerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenDrawerImplCopyWithImpl<$Res>
    extends _$NavDrawerEventCopyWithImpl<$Res, _$OpenDrawerImpl>
    implements _$$OpenDrawerImplCopyWith<$Res> {
  __$$OpenDrawerImplCopyWithImpl(
    _$OpenDrawerImpl _value,
    $Res Function(_$OpenDrawerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OpenDrawerImpl implements _OpenDrawer {
  const _$OpenDrawerImpl();

  @override
  String toString() {
    return 'NavDrawerEvent.openDrawer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenDrawerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() openDrawer,
    required TResult Function() closeDrawer,
    required TResult Function() toggleDrawer,
    required TResult Function(bool isOpen) drawerChanged,
  }) {
    return openDrawer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? openDrawer,
    TResult? Function()? closeDrawer,
    TResult? Function()? toggleDrawer,
    TResult? Function(bool isOpen)? drawerChanged,
  }) {
    return openDrawer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? openDrawer,
    TResult Function()? closeDrawer,
    TResult Function()? toggleDrawer,
    TResult Function(bool isOpen)? drawerChanged,
    required TResult orElse(),
  }) {
    if (openDrawer != null) {
      return openDrawer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CloseDrawer value) closeDrawer,
    required TResult Function(_ToggleDrawer value) toggleDrawer,
    required TResult Function(_DrawerChanged value) drawerChanged,
  }) {
    return openDrawer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CloseDrawer value)? closeDrawer,
    TResult? Function(_ToggleDrawer value)? toggleDrawer,
    TResult? Function(_DrawerChanged value)? drawerChanged,
  }) {
    return openDrawer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CloseDrawer value)? closeDrawer,
    TResult Function(_ToggleDrawer value)? toggleDrawer,
    TResult Function(_DrawerChanged value)? drawerChanged,
    required TResult orElse(),
  }) {
    if (openDrawer != null) {
      return openDrawer(this);
    }
    return orElse();
  }
}

abstract class _OpenDrawer implements NavDrawerEvent {
  const factory _OpenDrawer() = _$OpenDrawerImpl;
}

/// @nodoc
abstract class _$$CloseDrawerImplCopyWith<$Res> {
  factory _$$CloseDrawerImplCopyWith(
    _$CloseDrawerImpl value,
    $Res Function(_$CloseDrawerImpl) then,
  ) = __$$CloseDrawerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CloseDrawerImplCopyWithImpl<$Res>
    extends _$NavDrawerEventCopyWithImpl<$Res, _$CloseDrawerImpl>
    implements _$$CloseDrawerImplCopyWith<$Res> {
  __$$CloseDrawerImplCopyWithImpl(
    _$CloseDrawerImpl _value,
    $Res Function(_$CloseDrawerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CloseDrawerImpl implements _CloseDrawer {
  const _$CloseDrawerImpl();

  @override
  String toString() {
    return 'NavDrawerEvent.closeDrawer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CloseDrawerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() openDrawer,
    required TResult Function() closeDrawer,
    required TResult Function() toggleDrawer,
    required TResult Function(bool isOpen) drawerChanged,
  }) {
    return closeDrawer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? openDrawer,
    TResult? Function()? closeDrawer,
    TResult? Function()? toggleDrawer,
    TResult? Function(bool isOpen)? drawerChanged,
  }) {
    return closeDrawer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? openDrawer,
    TResult Function()? closeDrawer,
    TResult Function()? toggleDrawer,
    TResult Function(bool isOpen)? drawerChanged,
    required TResult orElse(),
  }) {
    if (closeDrawer != null) {
      return closeDrawer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CloseDrawer value) closeDrawer,
    required TResult Function(_ToggleDrawer value) toggleDrawer,
    required TResult Function(_DrawerChanged value) drawerChanged,
  }) {
    return closeDrawer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CloseDrawer value)? closeDrawer,
    TResult? Function(_ToggleDrawer value)? toggleDrawer,
    TResult? Function(_DrawerChanged value)? drawerChanged,
  }) {
    return closeDrawer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CloseDrawer value)? closeDrawer,
    TResult Function(_ToggleDrawer value)? toggleDrawer,
    TResult Function(_DrawerChanged value)? drawerChanged,
    required TResult orElse(),
  }) {
    if (closeDrawer != null) {
      return closeDrawer(this);
    }
    return orElse();
  }
}

abstract class _CloseDrawer implements NavDrawerEvent {
  const factory _CloseDrawer() = _$CloseDrawerImpl;
}

/// @nodoc
abstract class _$$ToggleDrawerImplCopyWith<$Res> {
  factory _$$ToggleDrawerImplCopyWith(
    _$ToggleDrawerImpl value,
    $Res Function(_$ToggleDrawerImpl) then,
  ) = __$$ToggleDrawerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleDrawerImplCopyWithImpl<$Res>
    extends _$NavDrawerEventCopyWithImpl<$Res, _$ToggleDrawerImpl>
    implements _$$ToggleDrawerImplCopyWith<$Res> {
  __$$ToggleDrawerImplCopyWithImpl(
    _$ToggleDrawerImpl _value,
    $Res Function(_$ToggleDrawerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleDrawerImpl implements _ToggleDrawer {
  const _$ToggleDrawerImpl();

  @override
  String toString() {
    return 'NavDrawerEvent.toggleDrawer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleDrawerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() openDrawer,
    required TResult Function() closeDrawer,
    required TResult Function() toggleDrawer,
    required TResult Function(bool isOpen) drawerChanged,
  }) {
    return toggleDrawer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? openDrawer,
    TResult? Function()? closeDrawer,
    TResult? Function()? toggleDrawer,
    TResult? Function(bool isOpen)? drawerChanged,
  }) {
    return toggleDrawer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? openDrawer,
    TResult Function()? closeDrawer,
    TResult Function()? toggleDrawer,
    TResult Function(bool isOpen)? drawerChanged,
    required TResult orElse(),
  }) {
    if (toggleDrawer != null) {
      return toggleDrawer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CloseDrawer value) closeDrawer,
    required TResult Function(_ToggleDrawer value) toggleDrawer,
    required TResult Function(_DrawerChanged value) drawerChanged,
  }) {
    return toggleDrawer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CloseDrawer value)? closeDrawer,
    TResult? Function(_ToggleDrawer value)? toggleDrawer,
    TResult? Function(_DrawerChanged value)? drawerChanged,
  }) {
    return toggleDrawer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CloseDrawer value)? closeDrawer,
    TResult Function(_ToggleDrawer value)? toggleDrawer,
    TResult Function(_DrawerChanged value)? drawerChanged,
    required TResult orElse(),
  }) {
    if (toggleDrawer != null) {
      return toggleDrawer(this);
    }
    return orElse();
  }
}

abstract class _ToggleDrawer implements NavDrawerEvent {
  const factory _ToggleDrawer() = _$ToggleDrawerImpl;
}

/// @nodoc
abstract class _$$DrawerChangedImplCopyWith<$Res> {
  factory _$$DrawerChangedImplCopyWith(
    _$DrawerChangedImpl value,
    $Res Function(_$DrawerChangedImpl) then,
  ) = __$$DrawerChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class __$$DrawerChangedImplCopyWithImpl<$Res>
    extends _$NavDrawerEventCopyWithImpl<$Res, _$DrawerChangedImpl>
    implements _$$DrawerChangedImplCopyWith<$Res> {
  __$$DrawerChangedImplCopyWithImpl(
    _$DrawerChangedImpl _value,
    $Res Function(_$DrawerChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isOpen = null}) {
    return _then(
      _$DrawerChangedImpl(
        isOpen:
            null == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$DrawerChangedImpl implements _DrawerChanged {
  const _$DrawerChangedImpl({required this.isOpen});

  @override
  final bool isOpen;

  @override
  String toString() {
    return 'NavDrawerEvent.drawerChanged(isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawerChangedImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen);

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawerChangedImplCopyWith<_$DrawerChangedImpl> get copyWith =>
      __$$DrawerChangedImplCopyWithImpl<_$DrawerChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() openDrawer,
    required TResult Function() closeDrawer,
    required TResult Function() toggleDrawer,
    required TResult Function(bool isOpen) drawerChanged,
  }) {
    return drawerChanged(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? openDrawer,
    TResult? Function()? closeDrawer,
    TResult? Function()? toggleDrawer,
    TResult? Function(bool isOpen)? drawerChanged,
  }) {
    return drawerChanged?.call(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? openDrawer,
    TResult Function()? closeDrawer,
    TResult Function()? toggleDrawer,
    TResult Function(bool isOpen)? drawerChanged,
    required TResult orElse(),
  }) {
    if (drawerChanged != null) {
      return drawerChanged(isOpen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CloseDrawer value) closeDrawer,
    required TResult Function(_ToggleDrawer value) toggleDrawer,
    required TResult Function(_DrawerChanged value) drawerChanged,
  }) {
    return drawerChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CloseDrawer value)? closeDrawer,
    TResult? Function(_ToggleDrawer value)? toggleDrawer,
    TResult? Function(_DrawerChanged value)? drawerChanged,
  }) {
    return drawerChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CloseDrawer value)? closeDrawer,
    TResult Function(_ToggleDrawer value)? toggleDrawer,
    TResult Function(_DrawerChanged value)? drawerChanged,
    required TResult orElse(),
  }) {
    if (drawerChanged != null) {
      return drawerChanged(this);
    }
    return orElse();
  }
}

abstract class _DrawerChanged implements NavDrawerEvent {
  const factory _DrawerChanged({required final bool isOpen}) =
      _$DrawerChangedImpl;

  bool get isOpen;

  /// Create a copy of NavDrawerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrawerChangedImplCopyWith<_$DrawerChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NavDrawerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() closed,
    required TResult Function() opened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? closed,
    TResult? Function()? opened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Closed value) closed,
    required TResult Function(_Opened value) opened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Opened value)? opened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Closed value)? closed,
    TResult Function(_Opened value)? opened,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavDrawerStateCopyWith<$Res> {
  factory $NavDrawerStateCopyWith(
    NavDrawerState value,
    $Res Function(NavDrawerState) then,
  ) = _$NavDrawerStateCopyWithImpl<$Res, NavDrawerState>;
}

/// @nodoc
class _$NavDrawerStateCopyWithImpl<$Res, $Val extends NavDrawerState>
    implements $NavDrawerStateCopyWith<$Res> {
  _$NavDrawerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavDrawerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ClosedImplCopyWith<$Res> {
  factory _$$ClosedImplCopyWith(
    _$ClosedImpl value,
    $Res Function(_$ClosedImpl) then,
  ) = __$$ClosedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosedImplCopyWithImpl<$Res>
    extends _$NavDrawerStateCopyWithImpl<$Res, _$ClosedImpl>
    implements _$$ClosedImplCopyWith<$Res> {
  __$$ClosedImplCopyWithImpl(
    _$ClosedImpl _value,
    $Res Function(_$ClosedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavDrawerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosedImpl implements _Closed {
  const _$ClosedImpl();

  @override
  String toString() {
    return 'NavDrawerState.closed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() closed,
    required TResult Function() opened,
  }) {
    return closed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? closed,
    TResult? Function()? opened,
  }) {
    return closed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Closed value) closed,
    required TResult Function(_Opened value) opened,
  }) {
    return closed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Opened value)? opened,
  }) {
    return closed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Closed value)? closed,
    TResult Function(_Opened value)? opened,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(this);
    }
    return orElse();
  }
}

abstract class _Closed implements NavDrawerState {
  const factory _Closed() = _$ClosedImpl;
}

/// @nodoc
abstract class _$$OpenedImplCopyWith<$Res> {
  factory _$$OpenedImplCopyWith(
    _$OpenedImpl value,
    $Res Function(_$OpenedImpl) then,
  ) = __$$OpenedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenedImplCopyWithImpl<$Res>
    extends _$NavDrawerStateCopyWithImpl<$Res, _$OpenedImpl>
    implements _$$OpenedImplCopyWith<$Res> {
  __$$OpenedImplCopyWithImpl(
    _$OpenedImpl _value,
    $Res Function(_$OpenedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavDrawerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OpenedImpl implements _Opened {
  const _$OpenedImpl();

  @override
  String toString() {
    return 'NavDrawerState.opened()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() closed,
    required TResult Function() opened,
  }) {
    return opened();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? closed,
    TResult? Function()? opened,
  }) {
    return opened?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Closed value) closed,
    required TResult Function(_Opened value) opened,
  }) {
    return opened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Opened value)? opened,
  }) {
    return opened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Closed value)? closed,
    TResult Function(_Opened value)? opened,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened(this);
    }
    return orElse();
  }
}

abstract class _Opened implements NavDrawerState {
  const factory _Opened() = _$OpenedImpl;
}
