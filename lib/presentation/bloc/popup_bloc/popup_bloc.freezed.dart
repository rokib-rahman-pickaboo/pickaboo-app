// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PopupEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPopupContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPopupContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPopupContent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPopupContent value) getPopupContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPopupContent value)? getPopupContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPopupContent value)? getPopupContent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopupEventCopyWith<$Res> {
  factory $PopupEventCopyWith(
    PopupEvent value,
    $Res Function(PopupEvent) then,
  ) = _$PopupEventCopyWithImpl<$Res, PopupEvent>;
}

/// @nodoc
class _$PopupEventCopyWithImpl<$Res, $Val extends PopupEvent>
    implements $PopupEventCopyWith<$Res> {
  _$PopupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopupEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetPopupContentImplCopyWith<$Res> {
  factory _$$GetPopupContentImplCopyWith(
    _$GetPopupContentImpl value,
    $Res Function(_$GetPopupContentImpl) then,
  ) = __$$GetPopupContentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPopupContentImplCopyWithImpl<$Res>
    extends _$PopupEventCopyWithImpl<$Res, _$GetPopupContentImpl>
    implements _$$GetPopupContentImplCopyWith<$Res> {
  __$$GetPopupContentImplCopyWithImpl(
    _$GetPopupContentImpl _value,
    $Res Function(_$GetPopupContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PopupEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetPopupContentImpl
    with DiagnosticableTreeMixin
    implements _GetPopupContent {
  const _$GetPopupContentImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopupEvent.getPopupContent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PopupEvent.getPopupContent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPopupContentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPopupContent,
  }) {
    return getPopupContent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPopupContent,
  }) {
    return getPopupContent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPopupContent,
    required TResult orElse(),
  }) {
    if (getPopupContent != null) {
      return getPopupContent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPopupContent value) getPopupContent,
  }) {
    return getPopupContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPopupContent value)? getPopupContent,
  }) {
    return getPopupContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPopupContent value)? getPopupContent,
    required TResult orElse(),
  }) {
    if (getPopupContent != null) {
      return getPopupContent(this);
    }
    return orElse();
  }
}

abstract class _GetPopupContent implements PopupEvent {
  const factory _GetPopupContent() = _$GetPopupContentImpl;
}

/// @nodoc
mixin _$PopupState {
  PopupStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  PopupEntity? get popup => throw _privateConstructorUsedError;
  String get linkType => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Create a copy of PopupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopupStateCopyWith<PopupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopupStateCopyWith<$Res> {
  factory $PopupStateCopyWith(
    PopupState value,
    $Res Function(PopupState) then,
  ) = _$PopupStateCopyWithImpl<$Res, PopupState>;
  @useResult
  $Res call({
    PopupStatus status,
    AppErrorEntity? error,
    PopupEntity? popup,
    String linkType,
    String link,
    String name,
    String imageUrl,
  });
}

/// @nodoc
class _$PopupStateCopyWithImpl<$Res, $Val extends PopupState>
    implements $PopupStateCopyWith<$Res> {
  _$PopupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? popup = freezed,
    Object? linkType = null,
    Object? link = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as PopupStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            popup:
                freezed == popup
                    ? _value.popup
                    : popup // ignore: cast_nullable_to_non_nullable
                        as PopupEntity?,
            linkType:
                null == linkType
                    ? _value.linkType
                    : linkType // ignore: cast_nullable_to_non_nullable
                        as String,
            link:
                null == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PopupStateImplCopyWith<$Res>
    implements $PopupStateCopyWith<$Res> {
  factory _$$PopupStateImplCopyWith(
    _$PopupStateImpl value,
    $Res Function(_$PopupStateImpl) then,
  ) = __$$PopupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PopupStatus status,
    AppErrorEntity? error,
    PopupEntity? popup,
    String linkType,
    String link,
    String name,
    String imageUrl,
  });
}

/// @nodoc
class __$$PopupStateImplCopyWithImpl<$Res>
    extends _$PopupStateCopyWithImpl<$Res, _$PopupStateImpl>
    implements _$$PopupStateImplCopyWith<$Res> {
  __$$PopupStateImplCopyWithImpl(
    _$PopupStateImpl _value,
    $Res Function(_$PopupStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PopupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? popup = freezed,
    Object? linkType = null,
    Object? link = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(
      _$PopupStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as PopupStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        popup:
            freezed == popup
                ? _value.popup
                : popup // ignore: cast_nullable_to_non_nullable
                    as PopupEntity?,
        linkType:
            null == linkType
                ? _value.linkType
                : linkType // ignore: cast_nullable_to_non_nullable
                    as String,
        link:
            null == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PopupStateImpl with DiagnosticableTreeMixin implements _PopupState {
  const _$PopupStateImpl({
    this.status = PopupStatus.initial,
    this.error,
    this.popup,
    this.linkType = '',
    this.link = '',
    this.name = '',
    this.imageUrl = '',
  });

  @override
  @JsonKey()
  final PopupStatus status;
  @override
  final AppErrorEntity? error;
  @override
  final PopupEntity? popup;
  @override
  @JsonKey()
  final String linkType;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopupState(status: $status, error: $error, popup: $popup, linkType: $linkType, link: $link, name: $name, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopupState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('popup', popup))
      ..add(DiagnosticsProperty('linkType', linkType))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopupStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.popup, popup) || other.popup == popup) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    popup,
    linkType,
    link,
    name,
    imageUrl,
  );

  /// Create a copy of PopupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopupStateImplCopyWith<_$PopupStateImpl> get copyWith =>
      __$$PopupStateImplCopyWithImpl<_$PopupStateImpl>(this, _$identity);
}

abstract class _PopupState implements PopupState {
  const factory _PopupState({
    final PopupStatus status,
    final AppErrorEntity? error,
    final PopupEntity? popup,
    final String linkType,
    final String link,
    final String name,
    final String imageUrl,
  }) = _$PopupStateImpl;

  @override
  PopupStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  PopupEntity? get popup;
  @override
  String get linkType;
  @override
  String get link;
  @override
  String get name;
  @override
  String get imageUrl;

  /// Create a copy of PopupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopupStateImplCopyWith<_$PopupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
