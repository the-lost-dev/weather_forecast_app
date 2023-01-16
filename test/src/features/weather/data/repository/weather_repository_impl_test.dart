import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_forecast_app/src/config/config_exports.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/current_weather/response/weather_response.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/forecast_weather/response/forecast_weather_response.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/weather_api_manager.dart';
import 'package:weather_forecast_app/src/features/weather/data/data_exports.dart';

import '../../../../../mocks.dart';
import '../../../../../mocks.mocks.dart';

void main() async {
  late WeatherRepositoryImpl weatherRepository;
  late WeatherApiManager weatherApiManager;

  await dotenv.load(fileName: 'config.env');

  setUp(() {
    weatherApiManager = MockWeatherApiManager();
    weatherRepository = WeatherRepositoryImpl(weatherApiManager);
  });

  group('WeatherRepositoryImpl', () {
    //* Get current weather data test

    test(
        'repository with mocked network request to get current weather data, success',
        () async {
      when(weatherApiManager.getCurrentWeatherData(
        'Abuja',
        WeatherApiConstants.units,
        dotenv.env[BaseApiConstants.apiKey]!,
      )).thenAnswer(
        (_) => Future.value(WeatherResponse.fromJson(mockWeatherJson)),
      );

      final weather = await weatherRepository.getCurrentWeatherData(
        city: 'Abuja',
      );

      final result = weather.fold((f) => f, (result) => result);

      // expectations
      expect(result, expectedWeatherFromJson);
    });

    test(
        'repository with mocked network request to get current weather data, failure',
        () async {
      when(weatherApiManager.getCurrentWeatherData(
        'Abuja',
        WeatherApiConstants.units,
        dotenv.env[BaseApiConstants.apiKey]!,
      )).thenAnswer((_) => Future.value(throw Exception()));

      final weather = await weatherRepository.getCurrentWeatherData(
        city: 'Abuja',
      );

      final result = weather.fold((failure) => failure, (r) => null);

      // expectations
      expect(result!, isA<Failure>());
    });

    test(
        'repository with mocked network request to get forecast weather data, success',
        () async {
      when(weatherApiManager.getForecastWeatherData(
        'Abuja',
        WeatherApiConstants.units,
        dotenv.env[BaseApiConstants.apiKey]!,
      )).thenAnswer(
        (_) => Future.value(
            ForecastWeatherResponse.fromJson(mockForecastWeatherJson)),
      );

      final weather = await weatherRepository.getForecastWeatherData(
        city: 'Abuja',
      );

      final result = weather.fold(
        (l) => null,
        ((r) => r),
      );

      // expectations
      expect(result!, expectedForecastWeatherFromJson);
    });

    test(
        'repository with mocked network request to get forecast weather data, failure',
        () async {
      when(weatherApiManager.getForecastWeatherData(
        'Abuja',
        WeatherApiConstants.units,
        dotenv.env[BaseApiConstants.apiKey]!,
      )).thenAnswer((_) => Future.value(throw Exception()));

      final weather = await weatherRepository.getForecastWeatherData(
        city: 'Abuja',
      );

      final result = weather.fold((failure) => failure, (r) => null);

      expect(result!, isA<Failure>());
    });
  });
}
