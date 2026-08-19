// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) {
  return _TicketResponse.fromJson(json);
}

/// @nodoc
mixin _$TicketResponse {
  @HiveField(0)
  @JsonKey(name: "ticket_id", fromJson: _toString)
  String? get ticketId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "ticket_code", fromJson: _toString)
  String? get ticketCode => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "subject", fromJson: _toString)
  String? get subject => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "issue_type", fromJson: _toString)
  String? get issueType => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "last_reply_name", fromJson: _toString)
  String? get lastReplyName => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "last_reply_at", fromJson: _toString)
  String? get lastReplyAt => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "Status", fromJson: _toString)
  String? get status => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: "Department", fromJson: _toString)
  String? get department => throw _privateConstructorUsedError;

  /// Serializes this TicketResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketResponseCopyWith<TicketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketResponseCopyWith<$Res> {
  factory $TicketResponseCopyWith(
    TicketResponse value,
    $Res Function(TicketResponse) then,
  ) = _$TicketResponseCopyWithImpl<$Res, TicketResponse>;
  @useResult
  $Res call({
    @HiveField(0)
    @JsonKey(name: "ticket_id", fromJson: _toString)
    String? ticketId,
    @HiveField(1)
    @JsonKey(name: "ticket_code", fromJson: _toString)
    String? ticketCode,
    @HiveField(2)
    @JsonKey(name: "subject", fromJson: _toString)
    String? subject,
    @HiveField(3)
    @JsonKey(name: "issue_type", fromJson: _toString)
    String? issueType,
    @HiveField(4)
    @JsonKey(name: "last_reply_name", fromJson: _toString)
    String? lastReplyName,
    @HiveField(5)
    @JsonKey(name: "last_reply_at", fromJson: _toString)
    String? lastReplyAt,
    @HiveField(6) @JsonKey(name: "Status", fromJson: _toString) String? status,
    @HiveField(7)
    @JsonKey(name: "Department", fromJson: _toString)
    String? department,
  });
}

/// @nodoc
class _$TicketResponseCopyWithImpl<$Res, $Val extends TicketResponse>
    implements $TicketResponseCopyWith<$Res> {
  _$TicketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = freezed,
    Object? ticketCode = freezed,
    Object? subject = freezed,
    Object? issueType = freezed,
    Object? lastReplyName = freezed,
    Object? lastReplyAt = freezed,
    Object? status = freezed,
    Object? department = freezed,
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
            department:
                freezed == department
                    ? _value.department
                    : department // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketResponseImplCopyWith<$Res>
    implements $TicketResponseCopyWith<$Res> {
  factory _$$TicketResponseImplCopyWith(
    _$TicketResponseImpl value,
    $Res Function(_$TicketResponseImpl) then,
  ) = __$$TicketResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0)
    @JsonKey(name: "ticket_id", fromJson: _toString)
    String? ticketId,
    @HiveField(1)
    @JsonKey(name: "ticket_code", fromJson: _toString)
    String? ticketCode,
    @HiveField(2)
    @JsonKey(name: "subject", fromJson: _toString)
    String? subject,
    @HiveField(3)
    @JsonKey(name: "issue_type", fromJson: _toString)
    String? issueType,
    @HiveField(4)
    @JsonKey(name: "last_reply_name", fromJson: _toString)
    String? lastReplyName,
    @HiveField(5)
    @JsonKey(name: "last_reply_at", fromJson: _toString)
    String? lastReplyAt,
    @HiveField(6) @JsonKey(name: "Status", fromJson: _toString) String? status,
    @HiveField(7)
    @JsonKey(name: "Department", fromJson: _toString)
    String? department,
  });
}

/// @nodoc
class __$$TicketResponseImplCopyWithImpl<$Res>
    extends _$TicketResponseCopyWithImpl<$Res, _$TicketResponseImpl>
    implements _$$TicketResponseImplCopyWith<$Res> {
  __$$TicketResponseImplCopyWithImpl(
    _$TicketResponseImpl _value,
    $Res Function(_$TicketResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = freezed,
    Object? ticketCode = freezed,
    Object? subject = freezed,
    Object? issueType = freezed,
    Object? lastReplyName = freezed,
    Object? lastReplyAt = freezed,
    Object? status = freezed,
    Object? department = freezed,
  }) {
    return _then(
      _$TicketResponseImpl(
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
        department:
            freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketResponseImpl implements _TicketResponse {
  const _$TicketResponseImpl({
    @HiveField(0)
    @JsonKey(name: "ticket_id", fromJson: _toString)
    this.ticketId,
    @HiveField(1)
    @JsonKey(name: "ticket_code", fromJson: _toString)
    this.ticketCode,
    @HiveField(2) @JsonKey(name: "subject", fromJson: _toString) this.subject,
    @HiveField(3)
    @JsonKey(name: "issue_type", fromJson: _toString)
    this.issueType,
    @HiveField(4)
    @JsonKey(name: "last_reply_name", fromJson: _toString)
    this.lastReplyName,
    @HiveField(5)
    @JsonKey(name: "last_reply_at", fromJson: _toString)
    this.lastReplyAt,
    @HiveField(6) @JsonKey(name: "Status", fromJson: _toString) this.status,
    @HiveField(7)
    @JsonKey(name: "Department", fromJson: _toString)
    this.department,
  });

  factory _$TicketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketResponseImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "ticket_id", fromJson: _toString)
  final String? ticketId;
  @override
  @HiveField(1)
  @JsonKey(name: "ticket_code", fromJson: _toString)
  final String? ticketCode;
  @override
  @HiveField(2)
  @JsonKey(name: "subject", fromJson: _toString)
  final String? subject;
  @override
  @HiveField(3)
  @JsonKey(name: "issue_type", fromJson: _toString)
  final String? issueType;
  @override
  @HiveField(4)
  @JsonKey(name: "last_reply_name", fromJson: _toString)
  final String? lastReplyName;
  @override
  @HiveField(5)
  @JsonKey(name: "last_reply_at", fromJson: _toString)
  final String? lastReplyAt;
  @override
  @HiveField(6)
  @JsonKey(name: "Status", fromJson: _toString)
  final String? status;
  @override
  @HiveField(7)
  @JsonKey(name: "Department", fromJson: _toString)
  final String? department;

  @override
  String toString() {
    return 'TicketResponse(ticketId: $ticketId, ticketCode: $ticketCode, subject: $subject, issueType: $issueType, lastReplyName: $lastReplyName, lastReplyAt: $lastReplyAt, status: $status, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketResponseImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.ticketCode, ticketCode) ||
                other.ticketCode == ticketCode) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.issueType, issueType) ||
                other.issueType == issueType) &&
            (identical(other.lastReplyName, lastReplyName) ||
                other.lastReplyName == lastReplyName) &&
            (identical(other.lastReplyAt, lastReplyAt) ||
                other.lastReplyAt == lastReplyAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ticketId,
    ticketCode,
    subject,
    issueType,
    lastReplyName,
    lastReplyAt,
    status,
    department,
  );

  /// Create a copy of TicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketResponseImplCopyWith<_$TicketResponseImpl> get copyWith =>
      __$$TicketResponseImplCopyWithImpl<_$TicketResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketResponseImplToJson(this);
  }
}

abstract class _TicketResponse implements TicketResponse {
  const factory _TicketResponse({
    @HiveField(0)
    @JsonKey(name: "ticket_id", fromJson: _toString)
    final String? ticketId,
    @HiveField(1)
    @JsonKey(name: "ticket_code", fromJson: _toString)
    final String? ticketCode,
    @HiveField(2)
    @JsonKey(name: "subject", fromJson: _toString)
    final String? subject,
    @HiveField(3)
    @JsonKey(name: "issue_type", fromJson: _toString)
    final String? issueType,
    @HiveField(4)
    @JsonKey(name: "last_reply_name", fromJson: _toString)
    final String? lastReplyName,
    @HiveField(5)
    @JsonKey(name: "last_reply_at", fromJson: _toString)
    final String? lastReplyAt,
    @HiveField(6)
    @JsonKey(name: "Status", fromJson: _toString)
    final String? status,
    @HiveField(7)
    @JsonKey(name: "Department", fromJson: _toString)
    final String? department,
  }) = _$TicketResponseImpl;

  factory _TicketResponse.fromJson(Map<String, dynamic> json) =
      _$TicketResponseImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "ticket_id", fromJson: _toString)
  String? get ticketId;
  @override
  @HiveField(1)
  @JsonKey(name: "ticket_code", fromJson: _toString)
  String? get ticketCode;
  @override
  @HiveField(2)
  @JsonKey(name: "subject", fromJson: _toString)
  String? get subject;
  @override
  @HiveField(3)
  @JsonKey(name: "issue_type", fromJson: _toString)
  String? get issueType;
  @override
  @HiveField(4)
  @JsonKey(name: "last_reply_name", fromJson: _toString)
  String? get lastReplyName;
  @override
  @HiveField(5)
  @JsonKey(name: "last_reply_at", fromJson: _toString)
  String? get lastReplyAt;
  @override
  @HiveField(6)
  @JsonKey(name: "Status", fromJson: _toString)
  String? get status;
  @override
  @HiveField(7)
  @JsonKey(name: "Department", fromJson: _toString)
  String? get department;

  /// Create a copy of TicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketResponseImplCopyWith<_$TicketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
