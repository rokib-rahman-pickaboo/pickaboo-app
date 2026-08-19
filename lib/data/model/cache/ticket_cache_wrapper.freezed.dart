// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_cache_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TicketCacheWrapper _$TicketCacheWrapperFromJson(Map<String, dynamic> json) {
  return _TicketCacheWrapper.fromJson(json);
}

/// @nodoc
mixin _$TicketCacheWrapper {
  @HiveField(0)
  List<TicketResponse> get tickets => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  /// Serializes this TicketCacheWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketCacheWrapperCopyWith<TicketCacheWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCacheWrapperCopyWith<$Res> {
  factory $TicketCacheWrapperCopyWith(
    TicketCacheWrapper value,
    $Res Function(TicketCacheWrapper) then,
  ) = _$TicketCacheWrapperCopyWithImpl<$Res, TicketCacheWrapper>;
  @useResult
  $Res call({
    @HiveField(0) List<TicketResponse> tickets,
    @HiveField(1) DateTime cachedAt,
  });
}

/// @nodoc
class _$TicketCacheWrapperCopyWithImpl<$Res, $Val extends TicketCacheWrapper>
    implements $TicketCacheWrapperCopyWith<$Res> {
  _$TicketCacheWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tickets = null, Object? cachedAt = null}) {
    return _then(
      _value.copyWith(
            tickets:
                null == tickets
                    ? _value.tickets
                    : tickets // ignore: cast_nullable_to_non_nullable
                        as List<TicketResponse>,
            cachedAt:
                null == cachedAt
                    ? _value.cachedAt
                    : cachedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketCacheWrapperImplCopyWith<$Res>
    implements $TicketCacheWrapperCopyWith<$Res> {
  factory _$$TicketCacheWrapperImplCopyWith(
    _$TicketCacheWrapperImpl value,
    $Res Function(_$TicketCacheWrapperImpl) then,
  ) = __$$TicketCacheWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) List<TicketResponse> tickets,
    @HiveField(1) DateTime cachedAt,
  });
}

/// @nodoc
class __$$TicketCacheWrapperImplCopyWithImpl<$Res>
    extends _$TicketCacheWrapperCopyWithImpl<$Res, _$TicketCacheWrapperImpl>
    implements _$$TicketCacheWrapperImplCopyWith<$Res> {
  __$$TicketCacheWrapperImplCopyWithImpl(
    _$TicketCacheWrapperImpl _value,
    $Res Function(_$TicketCacheWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tickets = null, Object? cachedAt = null}) {
    return _then(
      _$TicketCacheWrapperImpl(
        tickets:
            null == tickets
                ? _value._tickets
                : tickets // ignore: cast_nullable_to_non_nullable
                    as List<TicketResponse>,
        cachedAt:
            null == cachedAt
                ? _value.cachedAt
                : cachedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketCacheWrapperImpl implements _TicketCacheWrapper {
  const _$TicketCacheWrapperImpl({
    @HiveField(0) required final List<TicketResponse> tickets,
    @HiveField(1) required this.cachedAt,
  }) : _tickets = tickets;

  factory _$TicketCacheWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketCacheWrapperImplFromJson(json);

  final List<TicketResponse> _tickets;
  @override
  @HiveField(0)
  List<TicketResponse> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  @HiveField(1)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'TicketCacheWrapper(tickets: $tickets, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketCacheWrapperImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tickets),
    cachedAt,
  );

  /// Create a copy of TicketCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketCacheWrapperImplCopyWith<_$TicketCacheWrapperImpl> get copyWith =>
      __$$TicketCacheWrapperImplCopyWithImpl<_$TicketCacheWrapperImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketCacheWrapperImplToJson(this);
  }
}

abstract class _TicketCacheWrapper implements TicketCacheWrapper {
  const factory _TicketCacheWrapper({
    @HiveField(0) required final List<TicketResponse> tickets,
    @HiveField(1) required final DateTime cachedAt,
  }) = _$TicketCacheWrapperImpl;

  factory _TicketCacheWrapper.fromJson(Map<String, dynamic> json) =
      _$TicketCacheWrapperImpl.fromJson;

  @override
  @HiveField(0)
  List<TicketResponse> get tickets;
  @override
  @HiveField(1)
  DateTime get cachedAt;

  /// Create a copy of TicketCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketCacheWrapperImplCopyWith<_$TicketCacheWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
