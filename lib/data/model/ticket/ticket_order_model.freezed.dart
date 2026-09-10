// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TicketOrderModel _$TicketOrderModelFromJson(Map<String, dynamic> json) {
  return _TicketOrderModel.fromJson(json);
}

/// @nodoc
mixin _$TicketOrderModel {
  @JsonKey(name: "order_id", fromJson: _toString)
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(
    name: "increment_id",
    readValue: _readIncrementId,
    fromJson: _toString,
  )
  String? get incrementId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", fromJson: _toString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "status", fromJson: _toString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "grand_total")
  double? get grandTotal => throw _privateConstructorUsedError;

  /// Serializes this TicketOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketOrderModelCopyWith<TicketOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketOrderModelCopyWith<$Res> {
  factory $TicketOrderModelCopyWith(
    TicketOrderModel value,
    $Res Function(TicketOrderModel) then,
  ) = _$TicketOrderModelCopyWithImpl<$Res, TicketOrderModel>;
  @useResult
  $Res call({
    @JsonKey(name: "order_id", fromJson: _toString) String? orderId,
    @JsonKey(
      name: "increment_id",
      readValue: _readIncrementId,
      fromJson: _toString,
    )
    String? incrementId,
    @JsonKey(name: "created_at", fromJson: _toString) String? createdAt,
    @JsonKey(name: "status", fromJson: _toString) String? status,
    @JsonKey(name: "grand_total") double? grandTotal,
  });
}

/// @nodoc
class _$TicketOrderModelCopyWithImpl<$Res, $Val extends TicketOrderModel>
    implements $TicketOrderModelCopyWith<$Res> {
  _$TicketOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? incrementId = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(
      _value.copyWith(
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String?,
            incrementId:
                freezed == incrementId
                    ? _value.incrementId
                    : incrementId // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            grandTotal:
                freezed == grandTotal
                    ? _value.grandTotal
                    : grandTotal // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketOrderModelImplCopyWith<$Res>
    implements $TicketOrderModelCopyWith<$Res> {
  factory _$$TicketOrderModelImplCopyWith(
    _$TicketOrderModelImpl value,
    $Res Function(_$TicketOrderModelImpl) then,
  ) = __$$TicketOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "order_id", fromJson: _toString) String? orderId,
    @JsonKey(
      name: "increment_id",
      readValue: _readIncrementId,
      fromJson: _toString,
    )
    String? incrementId,
    @JsonKey(name: "created_at", fromJson: _toString) String? createdAt,
    @JsonKey(name: "status", fromJson: _toString) String? status,
    @JsonKey(name: "grand_total") double? grandTotal,
  });
}

/// @nodoc
class __$$TicketOrderModelImplCopyWithImpl<$Res>
    extends _$TicketOrderModelCopyWithImpl<$Res, _$TicketOrderModelImpl>
    implements _$$TicketOrderModelImplCopyWith<$Res> {
  __$$TicketOrderModelImplCopyWithImpl(
    _$TicketOrderModelImpl _value,
    $Res Function(_$TicketOrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? incrementId = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(
      _$TicketOrderModelImpl(
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String?,
        incrementId:
            freezed == incrementId
                ? _value.incrementId
                : incrementId // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        grandTotal:
            freezed == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketOrderModelImpl implements _TicketOrderModel {
  const _$TicketOrderModelImpl({
    @JsonKey(name: "order_id", fromJson: _toString) this.orderId,
    @JsonKey(
      name: "increment_id",
      readValue: _readIncrementId,
      fromJson: _toString,
    )
    this.incrementId,
    @JsonKey(name: "created_at", fromJson: _toString) this.createdAt,
    @JsonKey(name: "status", fromJson: _toString) this.status,
    @JsonKey(name: "grand_total") this.grandTotal,
  });

  factory _$TicketOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketOrderModelImplFromJson(json);

  @override
  @JsonKey(name: "order_id", fromJson: _toString)
  final String? orderId;
  @override
  @JsonKey(
    name: "increment_id",
    readValue: _readIncrementId,
    fromJson: _toString,
  )
  final String? incrementId;
  @override
  @JsonKey(name: "created_at", fromJson: _toString)
  final String? createdAt;
  @override
  @JsonKey(name: "status", fromJson: _toString)
  final String? status;
  @override
  @JsonKey(name: "grand_total")
  final double? grandTotal;

  @override
  String toString() {
    return 'TicketOrderModel(orderId: $orderId, incrementId: $incrementId, createdAt: $createdAt, status: $status, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketOrderModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.incrementId, incrementId) ||
                other.incrementId == incrementId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    incrementId,
    createdAt,
    status,
    grandTotal,
  );

  /// Create a copy of TicketOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketOrderModelImplCopyWith<_$TicketOrderModelImpl> get copyWith =>
      __$$TicketOrderModelImplCopyWithImpl<_$TicketOrderModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketOrderModelImplToJson(this);
  }
}

abstract class _TicketOrderModel implements TicketOrderModel {
  const factory _TicketOrderModel({
    @JsonKey(name: "order_id", fromJson: _toString) final String? orderId,
    @JsonKey(
      name: "increment_id",
      readValue: _readIncrementId,
      fromJson: _toString,
    )
    final String? incrementId,
    @JsonKey(name: "created_at", fromJson: _toString) final String? createdAt,
    @JsonKey(name: "status", fromJson: _toString) final String? status,
    @JsonKey(name: "grand_total") final double? grandTotal,
  }) = _$TicketOrderModelImpl;

  factory _TicketOrderModel.fromJson(Map<String, dynamic> json) =
      _$TicketOrderModelImpl.fromJson;

  @override
  @JsonKey(name: "order_id", fromJson: _toString)
  String? get orderId;
  @override
  @JsonKey(
    name: "increment_id",
    readValue: _readIncrementId,
    fromJson: _toString,
  )
  String? get incrementId;
  @override
  @JsonKey(name: "created_at", fromJson: _toString)
  String? get createdAt;
  @override
  @JsonKey(name: "status", fromJson: _toString)
  String? get status;
  @override
  @JsonKey(name: "grand_total")
  double? get grandTotal;

  /// Create a copy of TicketOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketOrderModelImplCopyWith<_$TicketOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
