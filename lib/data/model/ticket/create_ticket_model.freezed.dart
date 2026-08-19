// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateTicketModel _$CreateTicketModelFromJson(Map<String, dynamic> json) {
  return _CreateTicketModel.fromJson(json);
}

/// @nodoc
mixin _$CreateTicketModel {
  @JsonKey(name: "subject")
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "issue_type")
  String? get issueType => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File>? get attachments => throw _privateConstructorUsedError;

  /// Serializes this CreateTicketModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTicketModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTicketModelCopyWith<CreateTicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTicketModelCopyWith<$Res> {
  factory $CreateTicketModelCopyWith(
    CreateTicketModel value,
    $Res Function(CreateTicketModel) then,
  ) = _$CreateTicketModelCopyWithImpl<$Res, CreateTicketModel>;
  @useResult
  $Res call({
    @JsonKey(name: "subject") String subject,
    @JsonKey(name: "body") String body,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "issue_type") String? issueType,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<File>? attachments,
  });
}

/// @nodoc
class _$CreateTicketModelCopyWithImpl<$Res, $Val extends CreateTicketModel>
    implements $CreateTicketModelCopyWith<$Res> {
  _$CreateTicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTicketModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? body = null,
    Object? orderId = freezed,
    Object? issueType = freezed,
    Object? attachments = freezed,
  }) {
    return _then(
      _value.copyWith(
            subject:
                null == subject
                    ? _value.subject
                    : subject // ignore: cast_nullable_to_non_nullable
                        as String,
            body:
                null == body
                    ? _value.body
                    : body // ignore: cast_nullable_to_non_nullable
                        as String,
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String?,
            issueType:
                freezed == issueType
                    ? _value.issueType
                    : issueType // ignore: cast_nullable_to_non_nullable
                        as String?,
            attachments:
                freezed == attachments
                    ? _value.attachments
                    : attachments // ignore: cast_nullable_to_non_nullable
                        as List<File>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateTicketModelImplCopyWith<$Res>
    implements $CreateTicketModelCopyWith<$Res> {
  factory _$$CreateTicketModelImplCopyWith(
    _$CreateTicketModelImpl value,
    $Res Function(_$CreateTicketModelImpl) then,
  ) = __$$CreateTicketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "subject") String subject,
    @JsonKey(name: "body") String body,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "issue_type") String? issueType,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<File>? attachments,
  });
}

/// @nodoc
class __$$CreateTicketModelImplCopyWithImpl<$Res>
    extends _$CreateTicketModelCopyWithImpl<$Res, _$CreateTicketModelImpl>
    implements _$$CreateTicketModelImplCopyWith<$Res> {
  __$$CreateTicketModelImplCopyWithImpl(
    _$CreateTicketModelImpl _value,
    $Res Function(_$CreateTicketModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateTicketModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? body = null,
    Object? orderId = freezed,
    Object? issueType = freezed,
    Object? attachments = freezed,
  }) {
    return _then(
      _$CreateTicketModelImpl(
        subject:
            null == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                    as String,
        body:
            null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                    as String,
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String?,
        issueType:
            freezed == issueType
                ? _value.issueType
                : issueType // ignore: cast_nullable_to_non_nullable
                    as String?,
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

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$CreateTicketModelImpl implements _CreateTicketModel {
  const _$CreateTicketModelImpl({
    @JsonKey(name: "subject") required this.subject,
    @JsonKey(name: "body") required this.body,
    @JsonKey(name: "order_id") this.orderId,
    @JsonKey(name: "issue_type") this.issueType,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<File>? attachments,
  }) : _attachments = attachments;

  factory _$CreateTicketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTicketModelImplFromJson(json);

  @override
  @JsonKey(name: "subject")
  final String subject;
  @override
  @JsonKey(name: "body")
  final String body;
  @override
  @JsonKey(name: "order_id")
  final String? orderId;
  @override
  @JsonKey(name: "issue_type")
  final String? issueType;
  final List<File>? _attachments;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateTicketModel(subject: $subject, body: $body, orderId: $orderId, issueType: $issueType, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTicketModelImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.issueType, issueType) ||
                other.issueType == issueType) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    subject,
    body,
    orderId,
    issueType,
    const DeepCollectionEquality().hash(_attachments),
  );

  /// Create a copy of CreateTicketModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTicketModelImplCopyWith<_$CreateTicketModelImpl> get copyWith =>
      __$$CreateTicketModelImplCopyWithImpl<_$CreateTicketModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTicketModelImplToJson(this);
  }
}

abstract class _CreateTicketModel implements CreateTicketModel {
  const factory _CreateTicketModel({
    @JsonKey(name: "subject") required final String subject,
    @JsonKey(name: "body") required final String body,
    @JsonKey(name: "order_id") final String? orderId,
    @JsonKey(name: "issue_type") final String? issueType,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<File>? attachments,
  }) = _$CreateTicketModelImpl;

  factory _CreateTicketModel.fromJson(Map<String, dynamic> json) =
      _$CreateTicketModelImpl.fromJson;

  @override
  @JsonKey(name: "subject")
  String get subject;
  @override
  @JsonKey(name: "body")
  String get body;
  @override
  @JsonKey(name: "order_id")
  String? get orderId;
  @override
  @JsonKey(name: "issue_type")
  String? get issueType;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File>? get attachments;

  /// Create a copy of CreateTicketModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTicketModelImplCopyWith<_$CreateTicketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
