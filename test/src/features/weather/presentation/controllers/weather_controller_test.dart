import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_forecast_app/src/config/config_exports.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/current_weather/response/weather_response.dart';
import 'package:weather_forecast_app/src/features/weather/data/data_exports.dart';
import 'package:weather_forecast_app/src/features/weather/data/models/weather_data.dart';
import 'package:weather_forecast_app/src/features/weather/presentation/controllers/weather_controller.dart';

import '../../../../../mocks.dart';
import '../../../../../mocks.mocks.dart';

void main() async {
  late WeatherRepositoryImpl weatherRepository;

  await dotenv.load(fileName: 'config.env');

  setUp(() {
    weatherRepository = MockWeatherRepositoryImpl();
  });

  group('WeatherController', () {
    test('initial state is AsyncLoading<WeatherData>()', () async {
      when(
        weatherRepository.getCurrentWeatherData(city: 'Abuja'),
      ).thenAnswer(
        (_) => Future.value(Right(WeatherResponse.fromJson(mockWeatherJson))),
      );

      final controller = WeatherController(
        weatherRepository: weatherRepository,
        city: 'Abuja',
      );

      verify(weatherRepository.getCurrentWeatherData(city: 'Abuja')).called(1);

      expect(controller.debugState, const AsyncLoading<WeatherData>());
    });

    test('get weather success', () async {
      when(
        weatherRepository.getCurrentWeatherData(city: 'Abuja'),
      ).thenAnswer(
        (_) => Future.value(Right(WeatherResponse.fromJson(mockWeatherJson))),
      );

      final controller = WeatherController(
        weatherRepository: weatherRepository,
        city: 'Abuja',
      );

      await controller.getWeather(city: 'Abuja');

      verify(weatherRepository.getCurrentWeatherData(city: 'Abuja')).called(2);

      expect(
        controller.debugState,
        AsyncData<WeatherData>(
          WeatherData.from(WeatherResponse.fromJson(mockWeatherJson)),
        ),
      );
    });

    test('get weather failure', () async {
      when(
        weatherRepository.getCurrentWeatherData(city: 'Abuja'),
      ).thenAnswer(
        (_) => Future.value(Left(Failure.fromException(Exception()))),
      );

      final controller = WeatherController(
        weatherRepository: weatherRepository,
        city: 'Abuja',
      );

      await controller.getWeather(city: 'Abuja');

      verify(weatherRepository.getCurrentWeatherData(city: 'Abuja')).called(2);

      expect(controller.debugState.hasError, true);
    });
  });
}
