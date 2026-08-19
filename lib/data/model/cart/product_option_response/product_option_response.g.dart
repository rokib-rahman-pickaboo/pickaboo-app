// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductOptionResponseImpl _$$ProductOptionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductOptionResponseImpl(
  extensionAttributes:
      json['extension_attributes'] == null
          ? null
          : ExtensionAttributesResponse.fromJson(
            json['extension_attributes'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$ProductOptionResponseImplToJson(
  _$ProductOptionResponseImpl instance,
) => <String, dynamic>{'extension_attributes': instance.extensionAttributes};

_$ExtensionAttributesResponseImpl _$$ExtensionAttributesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ExtensionAttributesResponseImpl(
  configurableItemOptions:
      (json['configurable_item_options'] as List<dynamic>?)
          ?.map(
            (e) => ConfigurableItemOptionResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  customOptions:
      (json['custom_options'] as List<dynamic>?)
          ?.map(
            (e) => ConfigurableItemOptionResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$$ExtensionAttributesResponseImplToJson(
  _$ExtensionAttributesResponseImpl instance,
) => <String, dynamic>{
  'configurable_item_options': instance.configurableItemOptions,
  'custom_options': instance.customOptions,
};

_$ConfigurableItemOptionResponseImpl
_$$ConfigurableItemOptionResponseImplFromJson(Map<String, dynamic> json) =>
    _$ConfigurableItemOptionResponseImpl(
      optionId: _anyToString(json['option_id']),
      optionValue: _anyToString(json['option_value']),
    );

Map<String, dynamic> _$$ConfigurableItemOptionResponseImplToJson(
  _$ConfigurableItemOptionResponseImpl instance,
) => <String, dynamic>{
  'option_id': instance.optionId,
  'option_value': instance.optionValue,
};
