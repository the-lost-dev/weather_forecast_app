import 'package:dartz/dartz.dart';
import 'package:weather_forecast_app/src/config/config_exports.dart';

import '../api/current_weather/response/weather_response.dart';
import '../api/forecast_weather/response/forecast_weather_response.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getCurrentWeatherData({
    required String city,
  });

  Future<Either<Failure, ForecastWeatherResponse>> getForecastWeatherData({
    required String city,
  });
}
