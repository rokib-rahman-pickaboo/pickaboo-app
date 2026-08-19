import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

@freezed
@HiveType(typeId: 11, adapterName: 'SliderAdapter')
class Slider with _$Slider {
  const factory Slider({
    @HiveField(0) @JsonKey(name: "slide_id") String? slideId,
    @HiveField(1) @JsonKey(name: "slider_id") String? sliderId,
    @HiveField(2) @JsonKey(name: "store_id") String? storeId,
    @HiveField(3) @JsonKey(name: "title") String? title,
    @HiveField(4) @JsonKey(name: "mobile_slug") String? mobileSlug,
    @HiveField(5) @JsonKey(name: "is_special_cat") String? isSpecialCat,
    @HiveField(6) @JsonKey(name: "image") String? image,
    @HiveField(7) @JsonKey(name: "mobile_image") String? mobileImage,
    @HiveField(8) @JsonKey(name: "image_position") String? imagePosition,
    @HiveField(9) @JsonKey(name: "link") String? link,
    @HiveField(10) @JsonKey(name: "linktype") String? linktype,
    @HiveField(11) @JsonKey(name: "order") String? order,
    @HiveField(12) @JsonKey(name: "status") String? status,
    @HiveField(13) @JsonKey(name: "created_at") DateTime? createdAt,
    @HiveField(14) @JsonKey(name: "updated_at") DateTime? updatedAt,
    @HiveField(15) @JsonKey(name: "url_key") String? urlKey,
    @HiveField(16) @JsonKey(name: "name") String? name,
    @HiveField(17) @JsonKey(name: "alias") String? alias,
    @HiveField(18) @JsonKey(name: "delay") String? delay,
    @HiveField(19) @JsonKey(name: "autoplay") String? autoplay,
    @HiveField(20) @JsonKey(name: "transition") String? transition,
    @HiveField(21) @JsonKey(name: "pagination") String? pagination,
    @HiveField(22) @JsonKey(name: "arrows") String? arrows,
    @HiveField(23) @JsonKey(name: "retina_image_size") String? retinaImageSize,
    @HiveField(24)
    @JsonKey(name: "retina_mobile_image_size")
    String? retinaMobileImageSize,
    @HiveField(25) @JsonKey(name: "mobile_image_url") String? mobileImageUrl,
    @HiveField(26) @JsonKey(name: "image_url") String? imageUrl,
  }) = _Slider;

  factory Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);
}
