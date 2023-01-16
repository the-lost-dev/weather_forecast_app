import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/config/config_exports.dart';

import '../../data/data_exports.dart';
import '../../data/models/weather_data.dart';
import '../components/search/city_search_box.dart';

class WeatherController extends StateNotifier<AsyncValue<WeatherData>> {
  WeatherController({
    required this.weatherRepository,
    required this.city,
  }) : super(const AsyncLoading()) {
    getWeather(city: city);
  }

  final WeatherRepositoryImpl weatherRepository;
  final String city;

  Future<void> getWeather({required String city}) async {
    state = const AsyncLoading();

    final response = await weatherRepository.getCurrentWeatherData(city: city);

    response.fold(
      (failure) => state = AsyncError(
        failure.message,
        StackTrace.current,
      ),
      (result) => state = AsyncData(WeatherData.from(result)),
    );
  }
}

final currentWeatherControllerProvider = StateNotifierProvider.autoDispose<
    WeatherController, AsyncValue<WeatherData>>((ref) {
  final city = ref.watch(cityProvider);
  final weatherRepository = getIt<WeatherRepositoryImpl>();
  return WeatherController(city: city, weatherRepository: weatherRepository);
});
