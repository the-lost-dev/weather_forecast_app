// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../entities/temp_params.dart';
import '../entities/weather_info.dart';
import '../entities/wind_param.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  const WeatherResponse({
    required this.main,
    required this.weather,
    required this.wind,
    required this.dt,
  });

  final TempParams main;
  final List<WeatherInfo> weather;
  final WindParam wind;
  final int dt;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

      
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @override
  String toString() {
    return 'WeatherResponse(main: $main, weather: $weather, wind: $wind, dt: $dt)';
  }

  @override
  bool operator ==(covariant WeatherResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.main == main &&
      listEquals(other.weather, weather) &&
      other.wind == wind &&
      other.dt == dt;
  }

  @override
  int get hashCode {
    return main.hashCode ^
      weather.hashCode ^
      wind.hashCode ^
      dt.hashCode;
  }
}
