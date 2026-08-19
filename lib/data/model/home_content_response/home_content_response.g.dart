// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeContentResponseAdapter extends TypeAdapter<HomeContentResponse> {
  @override
  final int typeId = 12;

  @override
  HomeContentResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeContentResponse(
      categoryList: (fields[0] as List)?.cast<Category>(),
      mainSlider: (fields[1] as List)?.cast<Slider>(),
      commonLinkSlider: (fields[2] as List)?.cast<Slider>(),
      categorySlider: (fields[3] as List)?.cast<CategorySlider>(),
      categoryProducts: (fields[4] as List)?.cast<CategoryProduct>(),
      justForYou: fields[5] as JustForYou?,
      cacheTime: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeContentResponse obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.categoryList)
      ..writeByte(1)
      ..write(obj.mainSlider)
      ..writeByte(2)
      ..write(obj.commonLinkSlider)
      ..writeByte(3)
      ..write(obj.categorySlider)
      ..writeByte(4)
      ..write(obj.categoryProducts)
      ..writeByte(5)
      ..write(obj.justForYou)
      ..writeByte(6)
      ..write(obj.cacheTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeContentResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryProductAdapter extends TypeAdapter<CategoryProduct> {
  @override
  final int typeId = 13;

  @override
  CategoryProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryProduct(
      categoryId: fields[0] as String?,
      categorySlug: fields[1] as String?,
      isHome: fields[2] as String?,
      isTodaysSpecial: fields[3] as String?,
      isLaunchingSoon: fields[4] as String?,
      isBrand: fields[5] as String?,
      isFeatured: fields[6] as String?,
      isBanner: fields[7] as String?,
      homeBlockBg: fields[8] as String?,
      isFlashHourCat: fields[9] as String?,
      flashHrStartDateTime: fields[10] as DateTime?,
      flashHrEndDateTime: fields[11] as DateTime?,
      background: fields[12] as String?,
      image: fields[13] as String?,
      catSlider: fields[14] as dynamic,
      categoryName: fields[15] as String?,
      isSpecial: fields[16] as String?,
      products: (fields[17] as List)?.cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryProduct obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.categorySlug)
      ..writeByte(2)
      ..write(obj.isHome)
      ..writeByte(3)
      ..write(obj.isTodaysSpecial)
      ..writeByte(4)
      ..write(obj.isLaunchingSoon)
      ..writeByte(5)
      ..write(obj.isBrand)
      ..writeByte(6)
      ..write(obj.isFeatured)
      ..writeByte(7)
      ..write(obj.isBanner)
      ..writeByte(8)
      ..write(obj.homeBlockBg)
      ..writeByte(9)
      ..write(obj.isFlashHourCat)
      ..writeByte(10)
      ..write(obj.flashHrStartDateTime)
      ..writeByte(11)
      ..write(obj.flashHrEndDateTime)
      ..writeByte(12)
      ..write(obj.background)
      ..writeByte(13)
      ..write(obj.image)
      ..writeByte(14)
      ..write(obj.catSlider)
      ..writeByte(15)
      ..write(obj.categoryName)
      ..writeByte(16)
      ..write(obj.isSpecial)
      ..writeByte(17)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategorySliderAdapter extends TypeAdapter<CategorySlider> {
  @override
  final int typeId = 14;

  @override
  CategorySlider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategorySlider(
      name: fields[0] as String?,
      alias: fields[1] as String?,
      tagrgetUrl: fields[2] as dynamic,
      backgroundColor: fields[3] as String?,
      linkTitleColor: fields[4] as String?,
      status: fields[5] as String?,
      slidesData: (fields[6] as List)?.cast<Slider>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategorySlider obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.alias)
      ..writeByte(2)
      ..write(obj.tagrgetUrl)
      ..writeByte(3)
      ..write(obj.backgroundColor)
      ..writeByte(4)
      ..write(obj.linkTitleColor)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.slidesData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorySliderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JustForYouAdapter extends TypeAdapter<JustForYou> {
  @override
  final int typeId = 15;

  @override
  JustForYou read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JustForYou(
      total: fields[0] as int?,
      list: (fields[1] as List)?.cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, JustForYou obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JustForYouAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeContentResponseImpl _$$HomeContentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HomeContentResponseImpl(
  categoryList:
      (json['category_list'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
  mainSlider:
      (json['main_slider'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
  commonLinkSlider:
      (json['common_link_slider'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
  categorySlider:
      (json['category_slider'] as List<dynamic>?)
          ?.map((e) => CategorySlider.fromJson(e as Map<String, dynamic>))
          .toList(),
  categoryProducts:
      (json['category_products'] as List<dynamic>?)
          ?.map((e) => CategoryProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
  justForYou:
      json['just_for_you'] == null
          ? null
          : JustForYou.fromJson(json['just_for_you'] as Map<String, dynamic>),
  cacheTime:
      json['cache_time'] == null
          ? null
          : DateTime.parse(json['cache_time'] as String),
);

Map<String, dynamic> _$$HomeContentResponseImplToJson(
  _$HomeContentResponseImpl instance,
) => <String, dynamic>{
  'category_list': instance.categoryList,
  'main_slider': instance.mainSlider,
  'common_link_slider': instance.commonLinkSlider,
  'category_slider': instance.categorySlider,
  'category_products': instance.categoryProducts,
  'just_for_you': instance.justForYou,
  'cache_time': instance.cacheTime?.toIso8601String(),
};

_$CategoryProductImpl _$$CategoryProductImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryProductImpl(
  categoryId: json['category_id'] as String?,
  categorySlug: json['category_slug'] as String?,
  isHome: json['is_home'] as String?,
  isTodaysSpecial: json['is_todays_special'] as String?,
  isLaunchingSoon: json['is_launching_soon'] as String?,
  isBrand: json['is_brand'] as String?,
  isFeatured: json['is_featured'] as String?,
  isBanner: json['is_banner'] as String?,
  homeBlockBg: json['home_block_bg'] as String?,
  isFlashHourCat: json['is_flash_hour_cat'] as String?,
  flashHrStartDateTime:
      json['flash_hr_start_date_time'] == null
          ? null
          : DateTime.parse(json['flash_hr_start_date_time'] as String),
  flashHrEndDateTime:
      json['flash_hr_end_date_time'] == null
          ? null
          : DateTime.parse(json['flash_hr_end_date_time'] as String),
  background: json['background'] as String?,
  image: json['image'] as String?,
  catSlider: json['cat_slider'],
  categoryName: json['category_name'] as String?,
  isSpecial: json['is_special'] as String?,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$CategoryProductImplToJson(
  _$CategoryProductImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_slug': instance.categorySlug,
  'is_home': instance.isHome,
  'is_todays_special': instance.isTodaysSpecial,
  'is_launching_soon': instance.isLaunchingSoon,
  'is_brand': instance.isBrand,
  'is_featured': instance.isFeatured,
  'is_banner': instance.isBanner,
  'home_block_bg': instance.homeBlockBg,
  'is_flash_hour_cat': instance.isFlashHourCat,
  'flash_hr_start_date_time': instance.flashHrStartDateTime?.toIso8601String(),
  'flash_hr_end_date_time': instance.flashHrEndDateTime?.toIso8601String(),
  'background': instance.background,
  'image': instance.image,
  'cat_slider': instance.catSlider,
  'category_name': instance.categoryName,
  'is_special': instance.isSpecial,
  'products': instance.products,
};

_$CategorySliderImpl _$$CategorySliderImplFromJson(Map<String, dynamic> json) =>
    _$CategorySliderImpl(
      name: json['name'] as String?,
      alias: json['alias'] as String?,
      tagrgetUrl: json['tagrget-url'],
      backgroundColor: json['background_color'] as String?,
      linkTitleColor: json['link_title_color'] as String?,
      status: json['status'] as String?,
      slidesData:
          (json['slides_data'] as List<dynamic>?)
              ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$CategorySliderImplToJson(
  _$CategorySliderImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'alias': instance.alias,
  'tagrget-url': instance.tagrgetUrl,
  'background_color': instance.backgroundColor,
  'link_title_color': instance.linkTitleColor,
  'status': instance.status,
  'slides_data': instance.slidesData,
};

_$JustForYouImpl _$$JustForYouImplFromJson(Map<String, dynamic> json) =>
    _$JustForYouImpl(
      total: (json['total'] as num?)?.toInt(),
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$JustForYouImplToJson(_$JustForYouImpl instance) =>
    <String, dynamic>{'total': instance.total, 'list': instance.list};
