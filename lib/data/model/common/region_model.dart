import 'package:json_annotation/json_annotation.dart';

part 'region_model.g.dart';

@JsonSerializable()
class RegionModel {
  @JsonKey(name: 'region_code')
  final String regionCode;
  final String region;
  @JsonKey(name: 'region_id')
  final int regionId;

  const RegionModel({
    required this.regionCode,
    required this.region,
    required this.regionId,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}
