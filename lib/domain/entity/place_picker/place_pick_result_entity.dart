class PlacePickResultEntity {
  final int? placeId;
  final double latitude;
  final double longitude;

  final String? address;
  final String? placeName;
  final String? house;
  final String? road;

  final String? area;
  final String? subArea;
  final String? city;
  final String? subDistrict;
  final String? district;
  final String? division;
  final String? union;
  final String? country;

  final String? uCode;
  final int? postCode;
  final String? pType;
  final String? subType;
  final int? distanceWithinMeters;

  const PlacePickResultEntity({
    this.placeId,
    required this.latitude,
    required this.longitude,
    this.address,
    this.placeName,
    this.house,
    this.road,
    this.area,
    this.subArea,
    this.city,
    this.subDistrict,
    this.district,
    this.division,
    this.union,
    this.country,
    this.uCode,
    this.postCode,
    this.pType,
    this.subType,
    this.distanceWithinMeters,
  });

  String get displayAddress =>
      placeName?.isNotEmpty == true
          ? placeName!
          : address?.isNotEmpty == true
              ? address!
              : area ?? city ?? district ?? '';

  PlacePickResultEntity copyWith({
    int? placeId,
    double? latitude,
    double? longitude,
    String? address,
    String? placeName,
    String? house,
    String? road,
    String? area,
    String? subArea,
    String? city,
    String? subDistrict,
    String? district,
    String? division,
    String? union,
    String? country,
    String? uCode,
    int? postCode,
    String? pType,
    String? subType,
    int? distanceWithinMeters,
  }) {
    return PlacePickResultEntity(
      placeId: placeId ?? this.placeId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      placeName: placeName ?? this.placeName,
      house: house ?? this.house,
      road: road ?? this.road,
      area: area ?? this.area,
      subArea: subArea ?? this.subArea,
      city: city ?? this.city,
      subDistrict: subDistrict ?? this.subDistrict,
      district: district ?? this.district,
      division: division ?? this.division,
      union: union ?? this.union,
      country: country ?? this.country,
      uCode: uCode ?? this.uCode,
      postCode: postCode ?? this.postCode,
      pType: pType ?? this.pType,
      subType: subType ?? this.subType,
      distanceWithinMeters: distanceWithinMeters ?? this.distanceWithinMeters,
    );
  }

  @override
  String toString() =>
      'PlacePickResultEntity(lat=$latitude, lon=$longitude, address=$displayAddress)';
}
