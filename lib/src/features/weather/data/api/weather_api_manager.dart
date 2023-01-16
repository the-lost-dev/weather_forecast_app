import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

import 'current_weather/response/weather_response.dart';
import 'forecast_weather/response/forecast_weather_response.dart';

part 'weather_api_manager.g.dart';


@LazySingleton()
@RestApi(
    baseUrl: '${BaseApiConstants.baseURL}${WeatherApiConstants.weatherModule}')
abstract class WeatherApiManager {
  @GET(WeatherApiConstants.currentWeatherEndpoint)
  Future<WeatherResponse> getCurrentWeatherData(
    @Query(WeatherApiConstants.cityQueryKey) String city,
    @Query(WeatherApiConstants.unitsQueryKey) String unit,
    @Query(BaseApiConstants.apiQueryKey) String apiKey,
  );

  @GET(WeatherApiConstants.forecastWeatherEndpoint)
  Future<ForecastWeatherResponse> getForecastWeatherData(
    @Query(WeatherApiConstants.cityQueryKey) String city,
    @Query(WeatherApiConstants.unitsQueryKey) String unit,
    @Query(BaseApiConstants.apiQueryKey) String apiKey,
  );

  @factoryMethod
  static WeatherApiManager create() {
    final client = Dio(BaseOptions(
      baseUrl:
          dotenv.env[BaseApiConstants.baseURLKey] ?? AppStrings.emptyString,
      receiveTimeout: 60000,
      connectTimeout: 60000,
      sendTimeout: 60000,
    ));

    return _WeatherApiManager(client);
  }
}
