const String mapUrl =
    "https://map.barikoi.com/styles/osm-liberty/style.json?key=";

const String autoCompleteUrl =
    "https://api.admin.barikoi.com/api/v2/place-autocomplete-without-auth?q=";

const String placeImageUrl =
    "https://api.admin.barikoi.com/api/v2/get-place-image-url-by-place-code/";

String reverseGeoUrl({required double latitude, required double longitude}) =>
    "https://api.admin.barikoi.com/api/v2/search/reverse/geocode?longitude=$longitude&latitude=$latitude";

String nearByPlacesUrl({
  required double latitude,
  required double longitude,
  required double distance,
  required int limit,
  required String query,
}) =>
    "https://api.admin.barikoi.com/api/v2/nearby-without-auth?longitude=$longitude&latitude=$latitude&distance=$distance&limit=$limit&q=$query";
