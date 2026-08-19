// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_picker_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoPickerStateImpl _$$PhotoPickerStateImplFromJson(
  Map<String, dynamic> json,
) => _$PhotoPickerStateImpl(
  status:
      $enumDecodeNullable(_$PhotoPickerStatusEnumMap, json['status']) ??
      PhotoPickerStatus.initial,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$$PhotoPickerStateImplToJson(
  _$PhotoPickerStateImpl instance,
) => <String, dynamic>{
  'status': _$PhotoPickerStatusEnumMap[instance.status]!,
  'errorMessage': instance.errorMessage,
};

const _$PhotoPickerStatusEnumMap = {
  PhotoPickerStatus.initial: 'initial',
  PhotoPickerStatus.loading: 'loading',
  PhotoPickerStatus.success: 'success',
  PhotoPickerStatus.empty: 'empty',
  PhotoPickerStatus.error: 'error',
  PhotoPickerStatus.clear: 'clear',
};
