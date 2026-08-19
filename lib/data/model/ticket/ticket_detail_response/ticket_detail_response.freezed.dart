// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TicketDetailResponse _$TicketDetailResponseFromJson(Map<String, dynamic> json) {
  return _TicketDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$TicketDetailResponse {
  @JsonKey(name: "ticket_id")
  String? get ticketId => throw _privateConstructorUsedError;
  @JsonKey(name: "ticket_code")
  String? get ticketCode => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "order_increment_id")
  String? get orderIncrementId => throw _privateConstructorUsedError;
  @JsonKey(name: "order_created_at")
  String? get orderCreatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "order_grand_total")
  String? get orderGrandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "order_status")
  String? get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "subject")
  String? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: "issue_type")
  String? get issueType => throw _privateConstructorUsedError;
  @JsonKey(name: "last_reply_name")
  String? get lastReplyName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_reply_at")
  String? get lastReplyAt => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "priority")
  String? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: "messages")
  List<Message>? get messages => throw _privateConstructorUsedError;

  /// Serializes this TicketDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketDetailResponseCopyWith<TicketDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDetailResponseCopyWith<$Res> {
  factory $TicketDetailResponseCopyWith(
    TicketDetailResponse value,
    $Res Function(TicketDetailResponse) then,
  ) = _$TicketDetailResponseCopyWithImpl<$Res, TicketDetailResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "ticket_id") String? ticketId,
    @JsonKey(name: "ticket_code") String? ticketCode,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "order_increment_id") String? orderIncrementId,
    @JsonKey(name: "order_created_at") String? orderCreatedAt,
    @JsonKey(name: "order_grand_total") String? orderGrandTotal,
    @JsonKey(name: "order_status") String? orderStatus,
    @JsonKey(name: "subject") String? subject,
    @JsonKey(name: "issue_type") String? issueType,
    @JsonKey(name: "last_reply_name") String? lastReplyName,
    @JsonKey(name: "last_reply_at") String? lastReplyAt,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "priority") String? priority,
    @JsonKey(name: "messages") List<Message>? messages,
  });
}

/// @nodoc
class _$TicketDetailResponseCopyWithImpl<
  $Res,
  $Val extends TicketDetailResponse
>
    implements $TicketDetailResponseCopyWith<$Res> {
  _$TicketDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = freezed,
    Object? ticketCode = freezed,
    Object? orderId = freezed,
    Object? orderIncrementId = freezed,
    Object? orderCreatedAt = freezed,
    Object? orderGrandTotal = freezed,
    Object? orderStatus = freezed,
    Object? subject = freezed,
    Object? issueType = freezed,
    Object? lastReplyName = freezed,
    Object? lastReplyAt = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? messages = freezed,
  }) {
    return _then(
      _value.copyWith(
            ticketId:
                freezed == ticketId
                    ? _value.ticketId
                    : ticketId // ignore: cast_nullable_to_non_nullable
                        as String?,
            ticketCode:
                freezed == ticketCode
                    ? _value.ticketCode
                    : ticketCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String?,
            orderIncrementId:
                freezed == orderIncrementId
                    ? _value.orderIncrementId
                    : orderIncrementId // ignore: cast_nullable_to_non_nullable
                        as String?,
            orderCreatedAt:
                freezed == orderCreatedAt
                    ? _value.orderCreatedAt
                    : orderCreatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            orderGrandTotal:
                freezed == orderGrandTotal
                    ? _value.orderGrandTotal
                    : orderGrandTotal // ignore: cast_nullable_to_non_nullable
                        as String?,
            orderStatus:
                freezed == orderStatus
                    ? _value.orderStatus
                    : orderStatus // ignore: cast_nullable_to_non_nullable
                        as String?,
            subject:
                freezed == subject
                    ? _value.subject
                    : subject // ignore: cast_nullable_to_non_nullable
                        as String?,
            issueType:
                freezed == issueType
                    ? _value.issueType
                    : issueType // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastReplyName:
                freezed == lastReplyName
                    ? _value.lastReplyName
                    : lastReplyName // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastReplyAt:
                freezed == lastReplyAt
                    ? _value.lastReplyAt
                    : lastReplyAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            priority:
                freezed == priority
                    ? _value.priority
                    : priority // ignore: cast_nullable_to_non_nullable
                        as String?,
            messages:
                freezed == messages
                    ? _value.messages
                    : messages // ignore: cast_nullable_to_non_nullable
                        as List<Message>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketDetailResponseImplCopyWith<$Res>
    implements $TicketDetailResponseCopyWith<$Res> {
  factory _$$TicketDetailResponseImplCopyWith(
    _$TicketDetailResponseImpl value,
    $Res Function(_$TicketDetailResponseImpl) then,
  ) = __$$TicketDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "ticket_id") String? ticketId,
    @JsonKey(name: "ticket_code") String? ticketCode,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "order_increment_id") String? orderIncrementId,
    @JsonKey(name: "order_created_at") String? orderCreatedAt,
    @JsonKey(name: "order_grand_total") String? orderGrandTotal,
    @JsonKey(name: "order_status") String? orderStatus,
    @JsonKey(name: "subject") String? subject,
    @JsonKey(name: "issue_type") String? issueType,
    @JsonKey(name: "last_reply_name") String? lastReplyName,
    @JsonKey(name: "last_reply_at") String? lastReplyAt,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "priority") String? priority,
    @JsonKey(name: "messages") List<Message>? messages,
  });
}

/// @nodoc
class __$$TicketDetailResponseImplCopyWithImpl<$Res>
    extends _$TicketDetailResponseCopyWithImpl<$Res, _$TicketDetailResponseImpl>
    implements _$$TicketDetailResponseImplCopyWith<$Res> {
  __$$TicketDetailResponseImplCopyWithImpl(
    _$TicketDetailResponseImpl _value,
    $Res Function(_$TicketDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = freezed,
    Object? ticketCode = freezed,
    Object? orderId = freezed,
    Object? orderIncrementId = freezed,
    Object? orderCreatedAt = freezed,
    Object? orderGrandTotal = freezed,
    Object? orderStatus = freezed,
    Object? subject = freezed,
    Object? issueType = freezed,
    Object? lastReplyName = freezed,
    Object? lastReplyAt = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? messages = freezed,
  }) {
    return _then(
      _$TicketDetailResponseImpl(
        ticketId:
            freezed == ticketId
                ? _value.ticketId
                : ticketId // ignore: cast_nullable_to_non_nullable
                    as String?,
        ticketCode:
            freezed == ticketCode
                ? _value.ticketCode
                : ticketCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String?,
        orderIncrementId:
            freezed == orderIncrementId
                ? _value.orderIncrementId
                : orderIncrementId // ignore: cast_nullable_to_non_nullable
                    as String?,
        orderCreatedAt:
            freezed == orderCreatedAt
                ? _value.orderCreatedAt
                : orderCreatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        orderGrandTotal:
            freezed == orderGrandTotal
                ? _value.orderGrandTotal
                : orderGrandTotal // ignore: cast_nullable_to_non_nullable
                    as String?,
        orderStatus:
            freezed == orderStatus
                ? _value.orderStatus
                : orderStatus // ignore: cast_nullable_to_non_nullable
                    as String?,
        subject:
            freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                    as String?,
        issueType:
            freezed == issueType
                ? _value.issueType
                : issueType // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastReplyName:
            freezed == lastReplyName
                ? _value.lastReplyName
                : lastReplyName // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastReplyAt:
            freezed == lastReplyAt
                ? _value.lastReplyAt
                : lastReplyAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        priority:
            freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                    as String?,
        messages:
            freezed == messages
                ? _value._messages
                : messages // ignore: cast_nullable_to_non_nullable
                    as List<Message>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketDetailResponseImpl implements _TicketDetailResponse {
  const _$TicketDetailResponseImpl({
    @JsonKey(name: "ticket_id") this.ticketId,
    @JsonKey(name: "ticket_code") this.ticketCode,
    @JsonKey(name: "order_id") this.orderId,
    @JsonKey(name: "order_increment_id") this.orderIncrementId,
    @JsonKey(name: "order_created_at") this.orderCreatedAt,
    @JsonKey(name: "order_grand_total") this.orderGrandTotal,
    @JsonKey(name: "order_status") this.orderStatus,
    @JsonKey(name: "subject") this.subject,
    @JsonKey(name: "issue_type") this.issueType,
    @JsonKey(name: "last_reply_name") this.lastReplyName,
    @JsonKey(name: "last_reply_at") this.lastReplyAt,
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "priority") this.priority,
    @JsonKey(name: "messages") final List<Message>? messages,
  }) : _messages = messages;

  factory _$TicketDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: "ticket_id")
  final String? ticketId;
  @override
  @JsonKey(name: "ticket_code")
  final String? ticketCode;
  @override
  @JsonKey(name: "order_id")
  final String? orderId;
  @override
  @JsonKey(name: "order_increment_id")
  final String? orderIncrementId;
  @override
  @JsonKey(name: "order_created_at")
  final String? orderCreatedAt;
  @override
  @JsonKey(name: "order_grand_total")
  final String? orderGrandTotal;
  @override
  @JsonKey(name: "order_status")
  final String? orderStatus;
  @override
  @JsonKey(name: "subject")
  final String? subject;
  @override
  @JsonKey(name: "issue_type")
  final String? issueType;
  @override
  @JsonKey(name: "last_reply_name")
  final String? lastReplyName;
  @override
  @JsonKey(name: "last_reply_at")
  final String? lastReplyAt;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "priority")
  final String? priority;
  final List<Message>? _messages;
  @override
  @JsonKey(name: "messages")
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TicketDetailResponse(ticketId: $ticketId, ticketCode: $ticketCode, orderId: $orderId, orderIncrementId: $orderIncrementId, orderCreatedAt: $orderCreatedAt, orderGrandTotal: $orderGrandTotal, orderStatus: $orderStatus, subject: $subject, issueType: $issueType, lastReplyName: $lastReplyName, lastReplyAt: $lastReplyAt, status: $status, priority: $priority, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDetailResponseImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.ticketCode, ticketCode) ||
                other.ticketCode == ticketCode) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderIncrementId, orderIncrementId) ||
                other.orderIncrementId == orderIncrementId) &&
            (identical(other.orderCreatedAt, orderCreatedAt) ||
                other.orderCreatedAt == orderCreatedAt) &&
            (identical(other.orderGrandTotal, orderGrandTotal) ||
                other.orderGrandTotal == orderGrandTotal) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.issueType, issueType) ||
                other.issueType == issueType) &&
            (identical(other.lastReplyName, lastReplyName) ||
                other.lastReplyName == lastReplyName) &&
            (identical(other.lastReplyAt, lastReplyAt) ||
                other.lastReplyAt == lastReplyAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ticketId,
    ticketCode,
    orderId,
    orderIncrementId,
    orderCreatedAt,
    orderGrandTotal,
    orderStatus,
    subject,
    issueType,
    lastReplyName,
    lastReplyAt,
    status,
    priority,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of TicketDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDetailResponseImplCopyWith<_$TicketDetailResponseImpl>
  get copyWith =>
      __$$TicketDetailResponseImplCopyWithImpl<_$TicketDetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketDetailResponseImplToJson(this);
  }
}

abstract class _TicketDetailResponse implements TicketDetailResponse {
  const factory _TicketDetailResponse({
    @JsonKey(name: "ticket_id") final String? ticketId,
    @JsonKey(name: "ticket_code") final String? ticketCode,
    @JsonKey(name: "order_id") final String? orderId,
    @JsonKey(name: "order_increment_id") final String? orderIncrementId,
    @JsonKey(name: "order_created_at") final String? orderCreatedAt,
    @JsonKey(name: "order_grand_total") final String? orderGrandTotal,
    @JsonKey(name: "order_status") final String? orderStatus,
    @JsonKey(name: "subject") final String? subject,
    @JsonKey(name: "issue_type") final String? issueType,
    @JsonKey(name: "last_reply_name") final String? lastReplyName,
    @JsonKey(name: "last_reply_at") final String? lastReplyAt,
    @JsonKey(name: "status") final String? status,
    @JsonKey(name: "priority") final String? priority,
    @JsonKey(name: "messages") final List<Message>? messages,
  }) = _$TicketDetailResponseImpl;

  factory _TicketDetailResponse.fromJson(Map<String, dynamic> json) =
      _$TicketDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: "ticket_id")
  String? get ticketId;
  @override
  @JsonKey(name: "ticket_code")
  String? get ticketCode;
  @override
  @JsonKey(name: "order_id")
  String? get orderId;
  @override
  @JsonKey(name: "order_increment_id")
  String? get orderIncrementId;
  @override
  @JsonKey(name: "order_created_at")
  String? get orderCreatedAt;
  @override
  @JsonKey(name: "order_grand_total")
  String? get orderGrandTotal;
  @override
  @JsonKey(name: "order_status")
  String? get orderStatus;
  @override
  @JsonKey(name: "subject")
  String? get subject;
  @override
  @JsonKey(name: "issue_type")
  String? get issueType;
  @override
  @JsonKey(name: "last_reply_name")
  String? get lastReplyName;
  @override
  @JsonKey(name: "last_reply_at")
  String? get lastReplyAt;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "priority")
  String? get priority;
  @override
  @JsonKey(name: "messages")
  List<Message>? get messages;

  /// Create a copy of TicketDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketDetailResponseImplCopyWith<_$TicketDetailResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  @JsonKey(name: "message_id")
  String? get messageId => throw _privateConstructorUsedError;
  @JsonKey(name: "replyer")
  String? get replyer => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: "attachment")
  List<Attachment>? get attachment => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({
    @JsonKey(name: "message_id") String? messageId,
    @JsonKey(name: "replyer") String? replyer,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "attachment") List<Attachment>? attachment,
  });
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = freezed,
    Object? replyer = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? attachment = freezed,
  }) {
    return _then(
      _value.copyWith(
            messageId:
                freezed == messageId
                    ? _value.messageId
                    : messageId // ignore: cast_nullable_to_non_nullable
                        as String?,
            replyer:
                freezed == replyer
                    ? _value.replyer
                    : replyer // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            body:
                freezed == body
                    ? _value.body
                    : body // ignore: cast_nullable_to_non_nullable
                        as String?,
            attachment:
                freezed == attachment
                    ? _value.attachment
                    : attachment // ignore: cast_nullable_to_non_nullable
                        as List<Attachment>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
    _$MessageImpl value,
    $Res Function(_$MessageImpl) then,
  ) = __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "message_id") String? messageId,
    @JsonKey(name: "replyer") String? replyer,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "attachment") List<Attachment>? attachment,
  });
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
    _$MessageImpl _value,
    $Res Function(_$MessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = freezed,
    Object? replyer = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? attachment = freezed,
  }) {
    return _then(
      _$MessageImpl(
        messageId:
            freezed == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                    as String?,
        replyer:
            freezed == replyer
                ? _value.replyer
                : replyer // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        body:
            freezed == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                    as String?,
        attachment:
            freezed == attachment
                ? _value._attachment
                : attachment // ignore: cast_nullable_to_non_nullable
                    as List<Attachment>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({
    @JsonKey(name: "message_id") this.messageId,
    @JsonKey(name: "replyer") this.replyer,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "body") this.body,
    @JsonKey(name: "attachment") final List<Attachment>? attachment,
  }) : _attachment = attachment;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  @JsonKey(name: "message_id")
  final String? messageId;
  @override
  @JsonKey(name: "replyer")
  final String? replyer;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "body")
  final String? body;
  final List<Attachment>? _attachment;
  @override
  @JsonKey(name: "attachment")
  List<Attachment>? get attachment {
    final value = _attachment;
    if (value == null) return null;
    if (_attachment is EqualUnmodifiableListView) return _attachment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Message(messageId: $messageId, replyer: $replyer, createdAt: $createdAt, body: $body, attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.replyer, replyer) || other.replyer == replyer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(
              other._attachment,
              _attachment,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    messageId,
    replyer,
    createdAt,
    body,
    const DeepCollectionEquality().hash(_attachment),
  );

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message({
    @JsonKey(name: "message_id") final String? messageId,
    @JsonKey(name: "replyer") final String? replyer,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "body") final String? body,
    @JsonKey(name: "attachment") final List<Attachment>? attachment,
  }) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  @JsonKey(name: "message_id")
  String? get messageId;
  @override
  @JsonKey(name: "replyer")
  String? get replyer;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "body")
  String? get body;
  @override
  @JsonKey(name: "attachment")
  List<Attachment>? get attachment;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
mixin _$Attachment {
  @JsonKey(name: "file_name")
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: "file_type")
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: "path")
  String? get path => throw _privateConstructorUsedError;

  /// Serializes this Attachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
    Attachment value,
    $Res Function(Attachment) then,
  ) = _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call({
    @JsonKey(name: "file_name") String? fileName,
    @JsonKey(name: "file_type") String? fileType,
    @JsonKey(name: "path") String? path,
  });
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? path = freezed,
  }) {
    return _then(
      _value.copyWith(
            fileName:
                freezed == fileName
                    ? _value.fileName
                    : fileName // ignore: cast_nullable_to_non_nullable
                        as String?,
            fileType:
                freezed == fileType
                    ? _value.fileType
                    : fileType // ignore: cast_nullable_to_non_nullable
                        as String?,
            path:
                freezed == path
                    ? _value.path
                    : path // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
    _$AttachmentImpl value,
    $Res Function(_$AttachmentImpl) then,
  ) = __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "file_name") String? fileName,
    @JsonKey(name: "file_type") String? fileType,
    @JsonKey(name: "path") String? path,
  });
}

/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
    _$AttachmentImpl _value,
    $Res Function(_$AttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? path = freezed,
  }) {
    return _then(
      _$AttachmentImpl(
        fileName:
            freezed == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                    as String?,
        fileType:
            freezed == fileType
                ? _value.fileType
                : fileType // ignore: cast_nullable_to_non_nullable
                    as String?,
        path:
            freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentImpl implements _Attachment {
  const _$AttachmentImpl({
    @JsonKey(name: "file_name") this.fileName,
    @JsonKey(name: "file_type") this.fileType,
    @JsonKey(name: "path") this.path,
  });

  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);

  @override
  @JsonKey(name: "file_name")
  final String? fileName;
  @override
  @JsonKey(name: "file_type")
  final String? fileType;
  @override
  @JsonKey(name: "path")
  final String? path;

  @override
  String toString() {
    return 'Attachment(fileName: $fileName, fileType: $fileType, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, fileType, path);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(this);
  }
}

abstract class _Attachment implements Attachment {
  const factory _Attachment({
    @JsonKey(name: "file_name") final String? fileName,
    @JsonKey(name: "file_type") final String? fileType,
    @JsonKey(name: "path") final String? path,
  }) = _$AttachmentImpl;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;

  @override
  @JsonKey(name: "file_name")
  String? get fileName;
  @override
  @JsonKey(name: "file_type")
  String? get fileType;
  @override
  @JsonKey(name: "path")
  String? get path;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
