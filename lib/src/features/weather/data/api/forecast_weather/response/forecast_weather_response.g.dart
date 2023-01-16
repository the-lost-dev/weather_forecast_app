// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeatherResponse _$ForecastWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    ForecastWeatherResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastWeatherResponseToJson(
        ForecastWeatherResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
