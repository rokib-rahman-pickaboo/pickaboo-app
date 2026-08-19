// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SortOption _$SortOptionFromJson(Map<String, dynamic> json) {
  return _SortOption.fromJson(json);
}

/// @nodoc
mixin _$SortOption {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this SortOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SortOptionCopyWith<SortOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortOptionCopyWith<$Res> {
  factory $SortOptionCopyWith(
    SortOption value,
    $Res Function(SortOption) then,
  ) = _$SortOptionCopyWithImpl<$Res, SortOption>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class _$SortOptionCopyWithImpl<$Res, $Val extends SortOption>
    implements $SortOptionCopyWith<$Res> {
  _$SortOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = freezed, Object? value = freezed}) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SortOptionImplCopyWith<$Res>
    implements $SortOptionCopyWith<$Res> {
  factory _$$SortOptionImplCopyWith(
    _$SortOptionImpl value,
    $Res Function(_$SortOptionImpl) then,
  ) = __$$SortOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class __$$SortOptionImplCopyWithImpl<$Res>
    extends _$SortOptionCopyWithImpl<$Res, _$SortOptionImpl>
    implements _$$SortOptionImplCopyWith<$Res> {
  __$$SortOptionImplCopyWithImpl(
    _$SortOptionImpl _value,
    $Res Function(_$SortOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = freezed, Object? value = freezed}) {
    return _then(
      _$SortOptionImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SortOptionImpl implements _SortOption {
  const _$SortOptionImpl({
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "value") this.value,
  });

  factory _$SortOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SortOptionImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'SortOption(title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortOptionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SortOptionImplCopyWith<_$SortOptionImpl> get copyWith =>
      __$$SortOptionImplCopyWithImpl<_$SortOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SortOptionImplToJson(this);
  }
}

abstract class _SortOption implements SortOption {
  const factory _SortOption({
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "value") final String? value,
  }) = _$SortOptionImpl;

  factory _SortOption.fromJson(Map<String, dynamic> json) =
      _$SortOptionImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "value")
  String? get value;

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SortOptionImplCopyWith<_$SortOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterItem _$FilterItemFromJson(Map<String, dynamic> json) {
  return _FilterItem.fromJson(json);
}

/// @nodoc
mixin _$FilterItem {
  @JsonKey(name: "label")
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: "value", fromJson: _parseFilterValue)
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "count", fromJson: _parseInt)
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this FilterItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterItemCopyWith<FilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterItemCopyWith<$Res> {
  factory $FilterItemCopyWith(
    FilterItem value,
    $Res Function(FilterItem) then,
  ) = _$FilterItemCopyWithImpl<$Res, FilterItem>;
  @useResult
  $Res call({
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _parseFilterValue) String? value,
    @JsonKey(name: "count", fromJson: _parseInt) int? count,
  });
}

/// @nodoc
class _$FilterItemCopyWithImpl<$Res, $Val extends FilterItem>
    implements $FilterItemCopyWith<$Res> {
  _$FilterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _value.copyWith(
            label:
                freezed == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
            count:
                freezed == count
                    ? _value.count
                    : count // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterItemImplCopyWith<$Res>
    implements $FilterItemCopyWith<$Res> {
  factory _$$FilterItemImplCopyWith(
    _$FilterItemImpl value,
    $Res Function(_$FilterItemImpl) then,
  ) = __$$FilterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _parseFilterValue) String? value,
    @JsonKey(name: "count", fromJson: _parseInt) int? count,
  });
}

/// @nodoc
class __$$FilterItemImplCopyWithImpl<$Res>
    extends _$FilterItemCopyWithImpl<$Res, _$FilterItemImpl>
    implements _$$FilterItemImplCopyWith<$Res> {
  __$$FilterItemImplCopyWithImpl(
    _$FilterItemImpl _value,
    $Res Function(_$FilterItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _$FilterItemImpl(
        label:
            freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
        count:
            freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterItemImpl implements _FilterItem {
  const _$FilterItemImpl({
    @JsonKey(name: "label") this.label,
    @JsonKey(name: "value", fromJson: _parseFilterValue) this.value,
    @JsonKey(name: "count", fromJson: _parseInt) this.count,
  });

  factory _$FilterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterItemImplFromJson(json);

  @override
  @JsonKey(name: "label")
  final String? label;
  @override
  @JsonKey(name: "value", fromJson: _parseFilterValue)
  final String? value;
  @override
  @JsonKey(name: "count", fromJson: _parseInt)
  final int? count;

  @override
  String toString() {
    return 'FilterItem(label: $label, value: $value, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, count);

  /// Create a copy of FilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterItemImplCopyWith<_$FilterItemImpl> get copyWith =>
      __$$FilterItemImplCopyWithImpl<_$FilterItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterItemImplToJson(this);
  }
}

abstract class _FilterItem implements FilterItem {
  const factory _FilterItem({
    @JsonKey(name: "label") final String? label,
    @JsonKey(name: "value", fromJson: _parseFilterValue) final String? value,
    @JsonKey(name: "count", fromJson: _parseInt) final int? count,
  }) = _$FilterItemImpl;

  factory _FilterItem.fromJson(Map<String, dynamic> json) =
      _$FilterItemImpl.fromJson;

  @override
  @JsonKey(name: "label")
  String? get label;
  @override
  @JsonKey(name: "value", fromJson: _parseFilterValue)
  String? get value;
  @override
  @JsonKey(name: "count", fromJson: _parseInt)
  int? get count;

  /// Create a copy of FilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterItemImplCopyWith<_$FilterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterAttribute _$FilterAttributeFromJson(Map<String, dynamic> json) {
  return _FilterAttribute.fromJson(json);
}

/// @nodoc
mixin _$FilterAttribute {
  @JsonKey(name: "filter_name")
  String? get filterName => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_code")
  String? get filterCode => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<FilterItem>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "special_for_phone")
  bool? get specialForPhone => throw _privateConstructorUsedError;

  /// Serializes this FilterAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterAttributeCopyWith<FilterAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterAttributeCopyWith<$Res> {
  factory $FilterAttributeCopyWith(
    FilterAttribute value,
    $Res Function(FilterAttribute) then,
  ) = _$FilterAttributeCopyWithImpl<$Res, FilterAttribute>;
  @useResult
  $Res call({
    @JsonKey(name: "filter_name") String? filterName,
    @JsonKey(name: "filter_code") String? filterCode,
    @JsonKey(name: "items") List<FilterItem>? items,
    @JsonKey(name: "special_for_phone") bool? specialForPhone,
  });
}

/// @nodoc
class _$FilterAttributeCopyWithImpl<$Res, $Val extends FilterAttribute>
    implements $FilterAttributeCopyWith<$Res> {
  _$FilterAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterName = freezed,
    Object? filterCode = freezed,
    Object? items = freezed,
    Object? specialForPhone = freezed,
  }) {
    return _then(
      _value.copyWith(
            filterName:
                freezed == filterName
                    ? _value.filterName
                    : filterName // ignore: cast_nullable_to_non_nullable
                        as String?,
            filterCode:
                freezed == filterCode
                    ? _value.filterCode
                    : filterCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<FilterItem>?,
            specialForPhone:
                freezed == specialForPhone
                    ? _value.specialForPhone
                    : specialForPhone // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterAttributeImplCopyWith<$Res>
    implements $FilterAttributeCopyWith<$Res> {
  factory _$$FilterAttributeImplCopyWith(
    _$FilterAttributeImpl value,
    $Res Function(_$FilterAttributeImpl) then,
  ) = __$$FilterAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "filter_name") String? filterName,
    @JsonKey(name: "filter_code") String? filterCode,
    @JsonKey(name: "items") List<FilterItem>? items,
    @JsonKey(name: "special_for_phone") bool? specialForPhone,
  });
}

/// @nodoc
class __$$FilterAttributeImplCopyWithImpl<$Res>
    extends _$FilterAttributeCopyWithImpl<$Res, _$FilterAttributeImpl>
    implements _$$FilterAttributeImplCopyWith<$Res> {
  __$$FilterAttributeImplCopyWithImpl(
    _$FilterAttributeImpl _value,
    $Res Function(_$FilterAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterName = freezed,
    Object? filterCode = freezed,
    Object? items = freezed,
    Object? specialForPhone = freezed,
  }) {
    return _then(
      _$FilterAttributeImpl(
        filterName:
            freezed == filterName
                ? _value.filterName
                : filterName // ignore: cast_nullable_to_non_nullable
                    as String?,
        filterCode:
            freezed == filterCode
                ? _value.filterCode
                : filterCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<FilterItem>?,
        specialForPhone:
            freezed == specialForPhone
                ? _value.specialForPhone
                : specialForPhone // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterAttributeImpl implements _FilterAttribute {
  const _$FilterAttributeImpl({
    @JsonKey(name: "filter_name") this.filterName,
    @JsonKey(name: "filter_code") this.filterCode,
    @JsonKey(name: "items") final List<FilterItem>? items,
    @JsonKey(name: "special_for_phone") this.specialForPhone,
  }) : _items = items;

  factory _$FilterAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterAttributeImplFromJson(json);

  @override
  @JsonKey(name: "filter_name")
  final String? filterName;
  @override
  @JsonKey(name: "filter_code")
  final String? filterCode;
  final List<FilterItem>? _items;
  @override
  @JsonKey(name: "items")
  List<FilterItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "special_for_phone")
  final bool? specialForPhone;

  @override
  String toString() {
    return 'FilterAttribute(filterName: $filterName, filterCode: $filterCode, items: $items, specialForPhone: $specialForPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterAttributeImpl &&
            (identical(other.filterName, filterName) ||
                other.filterName == filterName) &&
            (identical(other.filterCode, filterCode) ||
                other.filterCode == filterCode) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.specialForPhone, specialForPhone) ||
                other.specialForPhone == specialForPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    filterName,
    filterCode,
    const DeepCollectionEquality().hash(_items),
    specialForPhone,
  );

  /// Create a copy of FilterAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterAttributeImplCopyWith<_$FilterAttributeImpl> get copyWith =>
      __$$FilterAttributeImplCopyWithImpl<_$FilterAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterAttributeImplToJson(this);
  }
}

abstract class _FilterAttribute implements FilterAttribute {
  const factory _FilterAttribute({
    @JsonKey(name: "filter_name") final String? filterName,
    @JsonKey(name: "filter_code") final String? filterCode,
    @JsonKey(name: "items") final List<FilterItem>? items,
    @JsonKey(name: "special_for_phone") final bool? specialForPhone,
  }) = _$FilterAttributeImpl;

  factory _FilterAttribute.fromJson(Map<String, dynamic> json) =
      _$FilterAttributeImpl.fromJson;

  @override
  @JsonKey(name: "filter_name")
  String? get filterName;
  @override
  @JsonKey(name: "filter_code")
  String? get filterCode;
  @override
  @JsonKey(name: "items")
  List<FilterItem>? get items;
  @override
  @JsonKey(name: "special_for_phone")
  bool? get specialForPhone;

  /// Create a copy of FilterAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterAttributeImplCopyWith<_$FilterAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
