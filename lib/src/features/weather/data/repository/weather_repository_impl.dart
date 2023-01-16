import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/src/config/config_exports.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

import '../api/current_weather/response/weather_response.dart';
import '../api/forecast_weather/response/forecast_weather_response.dart';
import '../api/weather_api_manager.dart';
import 'weather_repository.dart';

@lazySingleton
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherApiManager _weatherApiManager;

  WeatherRepositoryImpl(this._weatherApiManager);

  Future<WeatherResponse> _getCurrentWeatherData({
    required String city,
  }) async {
    try {
      final response = await _weatherApiManager.getCurrentWeatherData(
        city,
        WeatherApiConstants.units,
        dotenv.env[BaseApiConstants.apiKey]!,
      );

      return response;
    } catch (err) {
      if (err is Failure) rethrow;

      throw Failure.fromException(err as Exception);
    }
  }

  @override
  Future<Either<Failure, WeatherResponse>> getCurrentWeatherData({
    required String city,
  }) async {
    final Either<Failure, WeatherResponse> result =
        await Task(() => _getCurrentWeatherData(city: city))
            .attempt()
            .map(
              (either) => either.leftMap(
                (obj) {
                  try {
                    return obj as Failure;
                  } catch (err) {
                    throw obj;
                  }
                },
              ),
            )
            .run(); 

    return result;
  }

  Future<ForecastWeatherResponse> _getForecastWeatherData({
    required String city,
  }) async {
    try {
      final response = await _weatherApiManager.getForecastWeatherData(
        city,
        WeatherApiConstants.units,
        dotenv.env[BaseApiConstants.apiKey]!,
      );

      return response;
    } catch (err) {
      if (err is Failure) rethrow;

      throw Failure.fromException(err as Exception);
    }
  }

  @override
  Future<Either<Failure, ForecastWeatherResponse>> getForecastWeatherData({
    required String city,
  }) async {
    final Either<Failure, ForecastWeatherResponse> result =
        await Task(() => _getForecastWeatherData(city: city))
            .attempt()
            .map(
              (either) => either.leftMap(
                (obj) {
                  try {
                    return obj as Failure;
                  } catch (err) {
                    throw obj;
                  }
                },
              ),
            )
            .run();

    return result;
  }
}
