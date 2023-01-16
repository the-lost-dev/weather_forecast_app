// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../current_weather/response/weather_response.dart';

part 'forecast_weather_response.g.dart';

@JsonSerializable()
class ForecastWeatherResponse {
  const ForecastWeatherResponse({
    required this.list,
  });

  final List<WeatherResponse> list;

  factory ForecastWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherResponseFromJson(json);

      
  Map<String, dynamic> toJson() => _$ForecastWeatherResponseToJson(this);

  @override
  String toString() => 'ForecastWeatherResponse(list: $list)';

  @override
  bool operator ==(covariant ForecastWeatherResponse other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}
