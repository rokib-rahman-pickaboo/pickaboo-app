// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TicketEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEventCopyWith<$Res> {
  factory $TicketEventCopyWith(
    TicketEvent value,
    $Res Function(TicketEvent) then,
  ) = _$TicketEventCopyWithImpl<$Res, TicketEvent>;
}

/// @nodoc
class _$TicketEventCopyWithImpl<$Res, $Val extends TicketEvent>
    implements $TicketEventCopyWith<$Res> {
  _$TicketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetTicketsEventImplCopyWith<$Res> {
  factory _$$GetTicketsEventImplCopyWith(
    _$GetTicketsEventImpl value,
    $Res Function(_$GetTicketsEventImpl) then,
  ) = __$$GetTicketsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class __$$GetTicketsEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$GetTicketsEventImpl>
    implements _$$GetTicketsEventImplCopyWith<$Res> {
  __$$GetTicketsEventImplCopyWithImpl(
    _$GetTicketsEventImpl _value,
    $Res Function(_$GetTicketsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? forceRefresh = null}) {
    return _then(
      _$GetTicketsEventImpl(
        forceRefresh:
            null == forceRefresh
                ? _value.forceRefresh
                : forceRefresh // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$GetTicketsEventImpl implements _GetTicketsEvent {
  const _$GetTicketsEventImpl({this.forceRefresh = false});

  @override
  @JsonKey()
  final bool forceRefresh;

  @override
  String toString() {
    return 'TicketEvent.getTickets(forceRefresh: $forceRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTicketsEventImpl &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTicketsEventImplCopyWith<_$GetTicketsEventImpl> get copyWith =>
      __$$GetTicketsEventImplCopyWithImpl<_$GetTicketsEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return getTickets(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return getTickets?.call(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (getTickets != null) {
      return getTickets(forceRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return getTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return getTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (getTickets != null) {
      return getTickets(this);
    }
    return orElse();
  }
}

abstract class _GetTicketsEvent implements TicketEvent {
  const factory _GetTicketsEvent({final bool forceRefresh}) =
      _$GetTicketsEventImpl;

  bool get forceRefresh;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTicketsEventImplCopyWith<_$GetTicketsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTicketDetailsEventImplCopyWith<$Res> {
  factory _$$GetTicketDetailsEventImplCopyWith(
    _$GetTicketDetailsEventImpl value,
    $Res Function(_$GetTicketDetailsEventImpl) then,
  ) = __$$GetTicketDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId});
}

/// @nodoc
class __$$GetTicketDetailsEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$GetTicketDetailsEventImpl>
    implements _$$GetTicketDetailsEventImplCopyWith<$Res> {
  __$$GetTicketDetailsEventImplCopyWithImpl(
    _$GetTicketDetailsEventImpl _value,
    $Res Function(_$GetTicketDetailsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticketId = null}) {
    return _then(
      _$GetTicketDetailsEventImpl(
        null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$GetTicketDetailsEventImpl implements _GetTicketDetailsEvent {
  const _$GetTicketDetailsEventImpl(this.ticketId);

  @override
  final String ticketId;

  @override
  String toString() {
    return 'TicketEvent.getTicketDetails(ticketId: $ticketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTicketDetailsEventImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTicketDetailsEventImplCopyWith<_$GetTicketDetailsEventImpl>
  get copyWith =>
      __$$GetTicketDetailsEventImplCopyWithImpl<_$GetTicketDetailsEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return getTicketDetails(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return getTicketDetails?.call(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (getTicketDetails != null) {
      return getTicketDetails(ticketId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return getTicketDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return getTicketDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (getTicketDetails != null) {
      return getTicketDetails(this);
    }
    return orElse();
  }
}

abstract class _GetTicketDetailsEvent implements TicketEvent {
  const factory _GetTicketDetailsEvent(final String ticketId) =
      _$GetTicketDetailsEventImpl;

  String get ticketId;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTicketDetailsEventImplCopyWith<_$GetTicketDetailsEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTicketEventImplCopyWith<$Res> {
  factory _$$CreateTicketEventImplCopyWith(
    _$CreateTicketEventImpl value,
    $Res Function(_$CreateTicketEventImpl) then,
  ) = __$$CreateTicketEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateTicketModel ticketData});

  $CreateTicketModelCopyWith<$Res> get ticketData;
}

/// @nodoc
class __$$CreateTicketEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$CreateTicketEventImpl>
    implements _$$CreateTicketEventImplCopyWith<$Res> {
  __$$CreateTicketEventImplCopyWithImpl(
    _$CreateTicketEventImpl _value,
    $Res Function(_$CreateTicketEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticketData = null}) {
    return _then(
      _$CreateTicketEventImpl(
        null == ticketData
            ? _value.ticketData
            : ticketData // ignore: cast_nullable_to_non_nullable
                as CreateTicketModel,
      ),
    );
  }

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateTicketModelCopyWith<$Res> get ticketData {
    return $CreateTicketModelCopyWith<$Res>(_value.ticketData, (value) {
      return _then(_value.copyWith(ticketData: value));
    });
  }
}

/// @nodoc

class _$CreateTicketEventImpl implements _CreateTicketEvent {
  const _$CreateTicketEventImpl(this.ticketData);

  @override
  final CreateTicketModel ticketData;

  @override
  String toString() {
    return 'TicketEvent.createTicket(ticketData: $ticketData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTicketEventImpl &&
            (identical(other.ticketData, ticketData) ||
                other.ticketData == ticketData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketData);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTicketEventImplCopyWith<_$CreateTicketEventImpl> get copyWith =>
      __$$CreateTicketEventImplCopyWithImpl<_$CreateTicketEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return createTicket(ticketData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return createTicket?.call(ticketData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (createTicket != null) {
      return createTicket(ticketData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return createTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return createTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (createTicket != null) {
      return createTicket(this);
    }
    return orElse();
  }
}

abstract class _CreateTicketEvent implements TicketEvent {
  const factory _CreateTicketEvent(final CreateTicketModel ticketData) =
      _$CreateTicketEventImpl;

  CreateTicketModel get ticketData;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTicketEventImplCopyWith<_$CreateTicketEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReplyTicketEventImplCopyWith<$Res> {
  factory _$$ReplyTicketEventImplCopyWith(
    _$ReplyTicketEventImpl value,
    $Res Function(_$ReplyTicketEventImpl) then,
  ) = __$$ReplyTicketEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId, String message, List<File>? attachments});
}

/// @nodoc
class __$$ReplyTicketEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$ReplyTicketEventImpl>
    implements _$$ReplyTicketEventImplCopyWith<$Res> {
  __$$ReplyTicketEventImplCopyWithImpl(
    _$ReplyTicketEventImpl _value,
    $Res Function(_$ReplyTicketEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? message = null,
    Object? attachments = freezed,
  }) {
    return _then(
      _$ReplyTicketEventImpl(
        null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                as String,
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
        attachments:
            freezed == attachments
                ? _value._attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                    as List<File>?,
      ),
    );
  }
}

/// @nodoc

class _$ReplyTicketEventImpl implements _ReplyTicketEvent {
  const _$ReplyTicketEventImpl(
    this.ticketId,
    this.message, {
    final List<File>? attachments,
  }) : _attachments = attachments;

  @override
  final String ticketId;
  @override
  final String message;
  final List<File>? _attachments;
  @override
  List<File>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TicketEvent.replyTicket(ticketId: $ticketId, message: $message, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyTicketEventImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    ticketId,
    message,
    const DeepCollectionEquality().hash(_attachments),
  );

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyTicketEventImplCopyWith<_$ReplyTicketEventImpl> get copyWith =>
      __$$ReplyTicketEventImplCopyWithImpl<_$ReplyTicketEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return replyTicket(ticketId, message, attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return replyTicket?.call(ticketId, message, attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (replyTicket != null) {
      return replyTicket(ticketId, message, attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return replyTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return replyTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (replyTicket != null) {
      return replyTicket(this);
    }
    return orElse();
  }
}

abstract class _ReplyTicketEvent implements TicketEvent {
  const factory _ReplyTicketEvent(
    final String ticketId,
    final String message, {
    final List<File>? attachments,
  }) = _$ReplyTicketEventImpl;

  String get ticketId;
  String get message;
  List<File>? get attachments;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplyTicketEventImplCopyWith<_$ReplyTicketEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseTicketEventImplCopyWith<$Res> {
  factory _$$CloseTicketEventImplCopyWith(
    _$CloseTicketEventImpl value,
    $Res Function(_$CloseTicketEventImpl) then,
  ) = __$$CloseTicketEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId});
}

/// @nodoc
class __$$CloseTicketEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$CloseTicketEventImpl>
    implements _$$CloseTicketEventImplCopyWith<$Res> {
  __$$CloseTicketEventImplCopyWithImpl(
    _$CloseTicketEventImpl _value,
    $Res Function(_$CloseTicketEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticketId = null}) {
    return _then(
      _$CloseTicketEventImpl(
        null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$CloseTicketEventImpl implements _CloseTicketEvent {
  const _$CloseTicketEventImpl(this.ticketId);

  @override
  final String ticketId;

  @override
  String toString() {
    return 'TicketEvent.closeTicket(ticketId: $ticketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseTicketEventImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseTicketEventImplCopyWith<_$CloseTicketEventImpl> get copyWith =>
      __$$CloseTicketEventImplCopyWithImpl<_$CloseTicketEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return closeTicket(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return closeTicket?.call(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (closeTicket != null) {
      return closeTicket(ticketId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return closeTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return closeTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (closeTicket != null) {
      return closeTicket(this);
    }
    return orElse();
  }
}

abstract class _CloseTicketEvent implements TicketEvent {
  const factory _CloseTicketEvent(final String ticketId) =
      _$CloseTicketEventImpl;

  String get ticketId;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloseTicketEventImplCopyWith<_$CloseTicketEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTicketOrdersEventImplCopyWith<$Res> {
  factory _$$GetTicketOrdersEventImplCopyWith(
    _$GetTicketOrdersEventImpl value,
    $Res Function(_$GetTicketOrdersEventImpl) then,
  ) = __$$GetTicketOrdersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTicketOrdersEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$GetTicketOrdersEventImpl>
    implements _$$GetTicketOrdersEventImplCopyWith<$Res> {
  __$$GetTicketOrdersEventImplCopyWithImpl(
    _$GetTicketOrdersEventImpl _value,
    $Res Function(_$GetTicketOrdersEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTicketOrdersEventImpl implements _GetTicketOrdersEvent {
  const _$GetTicketOrdersEventImpl();

  @override
  String toString() {
    return 'TicketEvent.getTicketOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTicketOrdersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return getTicketOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return getTicketOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (getTicketOrders != null) {
      return getTicketOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return getTicketOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return getTicketOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (getTicketOrders != null) {
      return getTicketOrders(this);
    }
    return orElse();
  }
}

abstract class _GetTicketOrdersEvent implements TicketEvent {
  const factory _GetTicketOrdersEvent() = _$GetTicketOrdersEventImpl;
}

/// @nodoc
abstract class _$$ClearMessageEventImplCopyWith<$Res> {
  factory _$$ClearMessageEventImplCopyWith(
    _$ClearMessageEventImpl value,
    $Res Function(_$ClearMessageEventImpl) then,
  ) = __$$ClearMessageEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearMessageEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$ClearMessageEventImpl>
    implements _$$ClearMessageEventImplCopyWith<$Res> {
  __$$ClearMessageEventImplCopyWithImpl(
    _$ClearMessageEventImpl _value,
    $Res Function(_$ClearMessageEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearMessageEventImpl implements _ClearMessageEvent {
  const _$ClearMessageEventImpl();

  @override
  String toString() {
    return 'TicketEvent.clearMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearMessageEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getTickets,
    required TResult Function(String ticketId) getTicketDetails,
    required TResult Function(CreateTicketModel ticketData) createTicket,
    required TResult Function(
      String ticketId,
      String message,
      List<File>? attachments,
    )
    replyTicket,
    required TResult Function(String ticketId) closeTicket,
    required TResult Function() getTicketOrders,
    required TResult Function() clearMessage,
  }) {
    return clearMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getTickets,
    TResult? Function(String ticketId)? getTicketDetails,
    TResult? Function(CreateTicketModel ticketData)? createTicket,
    TResult? Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult? Function(String ticketId)? closeTicket,
    TResult? Function()? getTicketOrders,
    TResult? Function()? clearMessage,
  }) {
    return clearMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getTickets,
    TResult Function(String ticketId)? getTicketDetails,
    TResult Function(CreateTicketModel ticketData)? createTicket,
    TResult Function(String ticketId, String message, List<File>? attachments)?
    replyTicket,
    TResult Function(String ticketId)? closeTicket,
    TResult Function()? getTicketOrders,
    TResult Function()? clearMessage,
    required TResult orElse(),
  }) {
    if (clearMessage != null) {
      return clearMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTicketsEvent value) getTickets,
    required TResult Function(_GetTicketDetailsEvent value) getTicketDetails,
    required TResult Function(_CreateTicketEvent value) createTicket,
    required TResult Function(_ReplyTicketEvent value) replyTicket,
    required TResult Function(_CloseTicketEvent value) closeTicket,
    required TResult Function(_GetTicketOrdersEvent value) getTicketOrders,
    required TResult Function(_ClearMessageEvent value) clearMessage,
  }) {
    return clearMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTicketsEvent value)? getTickets,
    TResult? Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult? Function(_CreateTicketEvent value)? createTicket,
    TResult? Function(_ReplyTicketEvent value)? replyTicket,
    TResult? Function(_CloseTicketEvent value)? closeTicket,
    TResult? Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult? Function(_ClearMessageEvent value)? clearMessage,
  }) {
    return clearMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTicketsEvent value)? getTickets,
    TResult Function(_GetTicketDetailsEvent value)? getTicketDetails,
    TResult Function(_CreateTicketEvent value)? createTicket,
    TResult Function(_ReplyTicketEvent value)? replyTicket,
    TResult Function(_CloseTicketEvent value)? closeTicket,
    TResult Function(_GetTicketOrdersEvent value)? getTicketOrders,
    TResult Function(_ClearMessageEvent value)? clearMessage,
    required TResult orElse(),
  }) {
    if (clearMessage != null) {
      return clearMessage(this);
    }
    return orElse();
  }
}

abstract class _ClearMessageEvent implements TicketEvent {
  const factory _ClearMessageEvent() = _$ClearMessageEventImpl;
}

/// @nodoc
mixin _$TicketState {
  TicketStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  TicketDetailEntity? get ticketDetails => throw _privateConstructorUsedError;
  List<TicketOrderEntity> get orders => throw _privateConstructorUsedError;
  List<TicketIssueTypeEntity> get issueTypes =>
      throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketStateCopyWith<TicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
    TicketState value,
    $Res Function(TicketState) then,
  ) = _$TicketStateCopyWithImpl<$Res, TicketState>;
  @useResult
  $Res call({
    TicketStatus status,
    AppErrorEntity? error,
    List<TicketEntity> tickets,
    TicketDetailEntity? ticketDetails,
    List<TicketOrderEntity> orders,
    List<TicketIssueTypeEntity> issueTypes,
    String? successMessage,
  });
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? tickets = null,
    Object? ticketDetails = freezed,
    Object? orders = null,
    Object? issueTypes = null,
    Object? successMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as TicketStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            tickets:
                null == tickets
                    ? _value.tickets
                    : tickets // ignore: cast_nullable_to_non_nullable
                        as List<TicketEntity>,
            ticketDetails:
                freezed == ticketDetails
                    ? _value.ticketDetails
                    : ticketDetails // ignore: cast_nullable_to_non_nullable
                        as TicketDetailEntity?,
            orders:
                null == orders
                    ? _value.orders
                    : orders // ignore: cast_nullable_to_non_nullable
                        as List<TicketOrderEntity>,
            issueTypes:
                null == issueTypes
                    ? _value.issueTypes
                    : issueTypes // ignore: cast_nullable_to_non_nullable
                        as List<TicketIssueTypeEntity>,
            successMessage:
                freezed == successMessage
                    ? _value.successMessage
                    : successMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketStateImplCopyWith<$Res>
    implements $TicketStateCopyWith<$Res> {
  factory _$$TicketStateImplCopyWith(
    _$TicketStateImpl value,
    $Res Function(_$TicketStateImpl) then,
  ) = __$$TicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TicketStatus status,
    AppErrorEntity? error,
    List<TicketEntity> tickets,
    TicketDetailEntity? ticketDetails,
    List<TicketOrderEntity> orders,
    List<TicketIssueTypeEntity> issueTypes,
    String? successMessage,
  });
}

/// @nodoc
class __$$TicketStateImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateImpl>
    implements _$$TicketStateImplCopyWith<$Res> {
  __$$TicketStateImplCopyWithImpl(
    _$TicketStateImpl _value,
    $Res Function(_$TicketStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? tickets = null,
    Object? ticketDetails = freezed,
    Object? orders = null,
    Object? issueTypes = null,
    Object? successMessage = freezed,
  }) {
    return _then(
      _$TicketStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as TicketStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        tickets:
            null == tickets
                ? _value._tickets
                : tickets // ignore: cast_nullable_to_non_nullable
                    as List<TicketEntity>,
        ticketDetails:
            freezed == ticketDetails
                ? _value.ticketDetails
                : ticketDetails // ignore: cast_nullable_to_non_nullable
                    as TicketDetailEntity?,
        orders:
            null == orders
                ? _value._orders
                : orders // ignore: cast_nullable_to_non_nullable
                    as List<TicketOrderEntity>,
        issueTypes:
            null == issueTypes
                ? _value._issueTypes
                : issueTypes // ignore: cast_nullable_to_non_nullable
                    as List<TicketIssueTypeEntity>,
        successMessage:
            freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$TicketStateImpl implements _TicketState {
  const _$TicketStateImpl({
    this.status = TicketStatus.initial,
    this.error,
    final List<TicketEntity> tickets = const [],
    this.ticketDetails,
    final List<TicketOrderEntity> orders = const [],
    final List<TicketIssueTypeEntity> issueTypes = const [],
    this.successMessage,
  }) : _tickets = tickets,
       _orders = orders,
       _issueTypes = issueTypes;

  @override
  @JsonKey()
  final TicketStatus status;
  @override
  final AppErrorEntity? error;
  final List<TicketEntity> _tickets;
  @override
  @JsonKey()
  List<TicketEntity> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final TicketDetailEntity? ticketDetails;
  final List<TicketOrderEntity> _orders;
  @override
  @JsonKey()
  List<TicketOrderEntity> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<TicketIssueTypeEntity> _issueTypes;
  @override
  @JsonKey()
  List<TicketIssueTypeEntity> get issueTypes {
    if (_issueTypes is EqualUnmodifiableListView) return _issueTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issueTypes);
  }

  @override
  final String? successMessage;

  @override
  String toString() {
    return 'TicketState(status: $status, error: $error, tickets: $tickets, ticketDetails: $ticketDetails, orders: $orders, issueTypes: $issueTypes, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.ticketDetails, ticketDetails) ||
                other.ticketDetails == ticketDetails) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(
              other._issueTypes,
              _issueTypes,
            ) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    const DeepCollectionEquality().hash(_tickets),
    ticketDetails,
    const DeepCollectionEquality().hash(_orders),
    const DeepCollectionEquality().hash(_issueTypes),
    successMessage,
  );

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      __$$TicketStateImplCopyWithImpl<_$TicketStateImpl>(this, _$identity);
}

abstract class _TicketState implements TicketState {
  const factory _TicketState({
    final TicketStatus status,
    final AppErrorEntity? error,
    final List<TicketEntity> tickets,
    final TicketDetailEntity? ticketDetails,
    final List<TicketOrderEntity> orders,
    final List<TicketIssueTypeEntity> issueTypes,
    final String? successMessage,
  }) = _$TicketStateImpl;

  @override
  TicketStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  List<TicketEntity> get tickets;
  @override
  TicketDetailEntity? get ticketDetails;
  @override
  List<TicketOrderEntity> get orders;
  @override
  List<TicketIssueTypeEntity> get issueTypes;
  @override
  String? get successMessage;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
