// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SliderAdapter extends TypeAdapter<Slider> {
  @override
  final int typeId = 11;

  @override
  Slider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Slider(
      slideId: fields[0] as String?,
      sliderId: fields[1] as String?,
      storeId: fields[2] as String?,
      title: fields[3] as String?,
      mobileSlug: fields[4] as String?,
      isSpecialCat: fields[5] as String?,
      image: fields[6] as String?,
      mobileImage: fields[7] as String?,
      imagePosition: fields[8] as String?,
      link: fields[9] as String?,
      linktype: fields[10] as String?,
      order: fields[11] as String?,
      status: fields[12] as String?,
      createdAt: fields[13] as DateTime?,
      updatedAt: fields[14] as DateTime?,
      urlKey: fields[15] as String?,
      name: fields[16] as String?,
      alias: fields[17] as String?,
      delay: fields[18] as String?,
      autoplay: fields[19] as String?,
      transition: fields[20] as String?,
      pagination: fields[21] as String?,
      arrows: fields[22] as String?,
      retinaImageSize: fields[23] as String?,
      retinaMobileImageSize: fields[24] as String?,
      mobileImageUrl: fields[25] as String?,
      imageUrl: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Slider obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.slideId)
      ..writeByte(1)
      ..write(obj.sliderId)
      ..writeByte(2)
      ..write(obj.storeId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.mobileSlug)
      ..writeByte(5)
      ..write(obj.isSpecialCat)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.mobileImage)
      ..writeByte(8)
      ..write(obj.imagePosition)
      ..writeByte(9)
      ..write(obj.link)
      ..writeByte(10)
      ..write(obj.linktype)
      ..writeByte(11)
      ..write(obj.order)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.urlKey)
      ..writeByte(16)
      ..write(obj.name)
      ..writeByte(17)
      ..write(obj.alias)
      ..writeByte(18)
      ..write(obj.delay)
      ..writeByte(19)
      ..write(obj.autoplay)
      ..writeByte(20)
      ..write(obj.transition)
      ..writeByte(21)
      ..write(obj.pagination)
      ..writeByte(22)
      ..write(obj.arrows)
      ..writeByte(23)
      ..write(obj.retinaImageSize)
      ..writeByte(24)
      ..write(obj.retinaMobileImageSize)
      ..writeByte(25)
      ..write(obj.mobileImageUrl)
      ..writeByte(26)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderImpl _$$SliderImplFromJson(Map<String, dynamic> json) => _$SliderImpl(
  slideId: json['slide_id'] as String?,
  sliderId: json['slider_id'] as String?,
  storeId: json['store_id'] as String?,
  title: json['title'] as String?,
  mobileSlug: json['mobile_slug'] as String?,
  isSpecialCat: json['is_special_cat'] as String?,
  image: json['image'] as String?,
  mobileImage: json['mobile_image'] as String?,
  imagePosition: json['image_position'] as String?,
  link: json['link'] as String?,
  linktype: json['linktype'] as String?,
  order: json['order'] as String?,
  status: json['status'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  urlKey: json['url_key'] as String?,
  name: json['name'] as String?,
  alias: json['alias'] as String?,
  delay: json['delay'] as String?,
  autoplay: json['autoplay'] as String?,
  transition: json['transition'] as String?,
  pagination: json['pagination'] as String?,
  arrows: json['arrows'] as String?,
  retinaImageSize: json['retina_image_size'] as String?,
  retinaMobileImageSize: json['retina_mobile_image_size'] as String?,
  mobileImageUrl: json['mobile_image_url'] as String?,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$$SliderImplToJson(_$SliderImpl instance) =>
    <String, dynamic>{
      'slide_id': instance.slideId,
      'slider_id': instance.sliderId,
      'store_id': instance.storeId,
      'title': instance.title,
      'mobile_slug': instance.mobileSlug,
      'is_special_cat': instance.isSpecialCat,
      'image': instance.image,
      'mobile_image': instance.mobileImage,
      'image_position': instance.imagePosition,
      'link': instance.link,
      'linktype': instance.linktype,
      'order': instance.order,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'url_key': instance.urlKey,
      'name': instance.name,
      'alias': instance.alias,
      'delay': instance.delay,
      'autoplay': instance.autoplay,
      'transition': instance.transition,
      'pagination': instance.pagination,
      'arrows': instance.arrows,
      'retina_image_size': instance.retinaImageSize,
      'retina_mobile_image_size': instance.retinaMobileImageSize,
      'mobile_image_url': instance.mobileImageUrl,
      'image_url': instance.imageUrl,
    };
