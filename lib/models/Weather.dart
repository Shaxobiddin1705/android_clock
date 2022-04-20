import 'dart:convert';
/// id : "388520"
/// city_id : "1"
/// datetime : "2022-04-20 05:00:00"
/// cloud_amount : "clear"
/// air_t : 16.6
/// meteors : null
/// weather_code : "light_rain"
/// datetime_ms : 1650412800000
/// city : {"id":"1","region_id":"1","name":"tashkent","is_regional_center":true,"latitude":41.26465,"longitude":69.21627,"has_data":"1","has_climatic_data":"1","is_visible":"1","title":"Toshkent"}
/// time_of_day : "night"

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());
class Weather {
  Weather({
      this.id, 
      this.cityId, 
      this.datetime, 
      this.cloudAmount, 
      this.airT, 
      this.meteors, 
      this.weatherCode, 
      this.datetimeMs, 
      this.city, 
      this.timeOfDay,});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    cityId = json['city_id'];
    datetime = json['datetime'];
    cloudAmount = json['cloud_amount'];
    airT = json['air_t'];
    meteors = json['meteors'];
    weatherCode = json['weather_code'];
    datetimeMs = json['datetime_ms'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    timeOfDay = json['time_of_day'];
  }
  String? id;
  String? cityId;
  String? datetime;
  String? cloudAmount;
  num? airT;
  dynamic meteors;
  String? weatherCode;
  int? datetimeMs;
  City? city;
  String? timeOfDay;
Weather copyWith({  String? id,
  String? cityId,
  String? datetime,
  String? cloudAmount,
  double? airT,
  dynamic meteors,
  String? weatherCode,
  int? datetimeMs,
  City? city,
  String? timeOfDay,
}) => Weather(  id: id ?? this.id,
  cityId: cityId ?? this.cityId,
  datetime: datetime ?? this.datetime,
  cloudAmount: cloudAmount ?? this.cloudAmount,
  airT: airT ?? this.airT,
  meteors: meteors ?? this.meteors,
  weatherCode: weatherCode ?? this.weatherCode,
  datetimeMs: datetimeMs ?? this.datetimeMs,
  city: city ?? this.city,
  timeOfDay: timeOfDay ?? this.timeOfDay,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city_id'] = cityId;
    map['datetime'] = datetime;
    map['cloud_amount'] = cloudAmount;
    map['air_t'] = airT;
    map['meteors'] = meteors;
    map['weather_code'] = weatherCode;
    map['datetime_ms'] = datetimeMs;
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['time_of_day'] = timeOfDay;
    return map;
  }

}

/// id : "1"
/// region_id : "1"
/// name : "tashkent"
/// is_regional_center : true
/// latitude : 41.26465
/// longitude : 69.21627
/// has_data : "1"
/// has_climatic_data : "1"
/// is_visible : "1"
/// title : "Toshkent"

City cityFromJson(String str) => City.fromJson(json.decode(str));
String cityToJson(City data) => json.encode(data.toJson());
class City {
  City({
      this.id, 
      this.regionId, 
      this.name, 
      this.isRegionalCenter, 
      this.latitude, 
      this.longitude, 
      this.hasData, 
      this.hasClimaticData, 
      this.isVisible, 
      this.title,});

  City.fromJson(dynamic json) {
    id = json['id'];
    regionId = json['region_id'];
    name = json['name'];
    isRegionalCenter = json['is_regional_center'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    hasData = json['has_data'];
    hasClimaticData = json['has_climatic_data'];
    isVisible = json['is_visible'];
    title = json['title'];
  }
  String? id;
  String? regionId;
  String? name;
  bool? isRegionalCenter;
  double? latitude;
  double? longitude;
  String? hasData;
  String? hasClimaticData;
  String? isVisible;
  String? title;
City copyWith({  String? id,
  String? regionId,
  String? name,
  bool? isRegionalCenter,
  double? latitude,
  double? longitude,
  String? hasData,
  String? hasClimaticData,
  String? isVisible,
  String? title,
}) => City(  id: id ?? this.id,
  regionId: regionId ?? this.regionId,
  name: name ?? this.name,
  isRegionalCenter: isRegionalCenter ?? this.isRegionalCenter,
  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  hasData: hasData ?? this.hasData,
  hasClimaticData: hasClimaticData ?? this.hasClimaticData,
  isVisible: isVisible ?? this.isVisible,
  title: title ?? this.title,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['region_id'] = regionId;
    map['name'] = name;
    map['is_regional_center'] = isRegionalCenter;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['has_data'] = hasData;
    map['has_climatic_data'] = hasClimaticData;
    map['is_visible'] = isVisible;
    map['title'] = title;
    return map;
  }

}