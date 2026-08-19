// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) {
  return _NotificationItem.fromJson(json);
}

/// @nodoc
mixin _$NotificationItem {
  @JsonKey(name: 'notification_id')
  int? get notificationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'deeplink')
  String? get deeplink => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fetched')
  int? get isFetched => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_clicked')
  int? get isClicked => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag')
  int? get tag => throw _privateConstructorUsedError;

  /// Serializes this NotificationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationItemCopyWith<NotificationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationItemCopyWith<$Res> {
  factory $NotificationItemCopyWith(
    NotificationItem value,
    $Res Function(NotificationItem) then,
  ) = _$NotificationItemCopyWithImpl<$Res, NotificationItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'notification_id') int? notificationId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'deeplink') String? deeplink,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'is_fetched') int? isFetched,
    @JsonKey(name: 'is_clicked') int? isClicked,
    @JsonKey(name: 'tag') int? tag,
  });
}

/// @nodoc
class _$NotificationItemCopyWithImpl<$Res, $Val extends NotificationItem>
    implements $NotificationItemCopyWith<$Res> {
  _$NotificationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? deeplink = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? isFetched = freezed,
    Object? isClicked = freezed,
    Object? tag = freezed,
  }) {
    return _then(
      _value.copyWith(
            notificationId:
                freezed == notificationId
                    ? _value.notificationId
                    : notificationId // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            deeplink:
                freezed == deeplink
                    ? _value.deeplink
                    : deeplink // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            isFetched:
                freezed == isFetched
                    ? _value.isFetched
                    : isFetched // ignore: cast_nullable_to_non_nullable
                        as int?,
            isClicked:
                freezed == isClicked
                    ? _value.isClicked
                    : isClicked // ignore: cast_nullable_to_non_nullable
                        as int?,
            tag:
                freezed == tag
                    ? _value.tag
                    : tag // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationItemImplCopyWith<$Res>
    implements $NotificationItemCopyWith<$Res> {
  factory _$$NotificationItemImplCopyWith(
    _$NotificationItemImpl value,
    $Res Function(_$NotificationItemImpl) then,
  ) = __$$NotificationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'notification_id') int? notificationId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'deeplink') String? deeplink,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'is_fetched') int? isFetched,
    @JsonKey(name: 'is_clicked') int? isClicked,
    @JsonKey(name: 'tag') int? tag,
  });
}

/// @nodoc
class __$$NotificationItemImplCopyWithImpl<$Res>
    extends _$NotificationItemCopyWithImpl<$Res, _$NotificationItemImpl>
    implements _$$NotificationItemImplCopyWith<$Res> {
  __$$NotificationItemImplCopyWithImpl(
    _$NotificationItemImpl _value,
    $Res Function(_$NotificationItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? deeplink = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? isFetched = freezed,
    Object? isClicked = freezed,
    Object? tag = freezed,
  }) {
    return _then(
      _$NotificationItemImpl(
        notificationId:
            freezed == notificationId
                ? _value.notificationId
                : notificationId // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        deeplink:
            freezed == deeplink
                ? _value.deeplink
                : deeplink // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        isFetched:
            freezed == isFetched
                ? _value.isFetched
                : isFetched // ignore: cast_nullable_to_non_nullable
                    as int?,
        isClicked:
            freezed == isClicked
                ? _value.isClicked
                : isClicked // ignore: cast_nullable_to_non_nullable
                    as int?,
        tag:
            freezed == tag
                ? _value.tag
                : tag // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationItemImpl extends _NotificationItem {
  _$NotificationItemImpl({
    @JsonKey(name: 'notification_id') this.notificationId,
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'message') this.message,
    @JsonKey(name: 'deeplink') this.deeplink,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'is_fetched') this.isFetched,
    @JsonKey(name: 'is_clicked') this.isClicked,
    @JsonKey(name: 'tag') this.tag,
  }) : super._();

  factory _$NotificationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationItemImplFromJson(json);

  @override
  @JsonKey(name: 'notification_id')
  final int? notificationId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'deeplink')
  final String? deeplink;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'is_fetched')
  final int? isFetched;
  @override
  @JsonKey(name: 'is_clicked')
  final int? isClicked;
  @override
  @JsonKey(name: 'tag')
  final int? tag;

  @override
  String toString() {
    return 'NotificationItem(notificationId: $notificationId, title: $title, message: $message, deeplink: $deeplink, imageUrl: $imageUrl, createdAt: $createdAt, isFetched: $isFetched, isClicked: $isClicked, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationItemImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.deeplink, deeplink) ||
                other.deeplink == deeplink) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched) &&
            (identical(other.isClicked, isClicked) ||
                other.isClicked == isClicked) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    notificationId,
    title,
    message,
    deeplink,
    imageUrl,
    createdAt,
    isFetched,
    isClicked,
    tag,
  );

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationItemImplCopyWith<_$NotificationItemImpl> get copyWith =>
      __$$NotificationItemImplCopyWithImpl<_$NotificationItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationItemImplToJson(this);
  }
}

abstract class _NotificationItem extends NotificationItem {
  factory _NotificationItem({
    @JsonKey(name: 'notification_id') final int? notificationId,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'deeplink') final String? deeplink,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'is_fetched') final int? isFetched,
    @JsonKey(name: 'is_clicked') final int? isClicked,
    @JsonKey(name: 'tag') final int? tag,
  }) = _$NotificationItemImpl;
  _NotificationItem._() : super._();

  factory _NotificationItem.fromJson(Map<String, dynamic> json) =
      _$NotificationItemImpl.fromJson;

  @override
  @JsonKey(name: 'notification_id')
  int? get notificationId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'deeplink')
  String? get deeplink;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'is_fetched')
  int? get isFetched;
  @override
  @JsonKey(name: 'is_clicked')
  int? get isClicked;
  @override
  @JsonKey(name: 'tag')
  int? get tag;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationItemImplCopyWith<_$NotificationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
